(* semantic.ml: semantic analysis for PGML AST *)
open Ast

exception Semantic_error of string

(* Allowed context names *)
let allowed_contexts = [
  "Numeric"; "Complex"; "Point"; "Vector"; "Vector2D";
  "Matrix"; "Interval"; "Complex-Point"; "Complex-Vector";
  "Complex-Matrix"; "Full"
]

(* Allowed macro files *)
let allowed_macros = ["PGcourse.pl"; "parserRadioButtons.pl"]

(* Convert AST constructors to strings for error messages *)
let string_of_module = function
  | Variables -> "variables"
  | Constants -> "constants"
  | Strings   -> "strings"
  | Operators -> "operators"

let string_of_context_method = function
  | CM_Add _      -> "add"
  | CM_Set _      -> "set"
  | CM_Are _      -> "are"
  | CM_Undefine _ -> "undefine"
  | CM_Redefine _ -> "redefine"

let string_of_value = function
  | VInt i   -> string_of_int i
  | VNum f   -> string_of_float f
  | VStr s   -> s
  | VIdent s -> s

(* Forward declarations for math_expr semantic checks *)
let rec check_math_expr : Ast.math_expr -> unit = function
  | Ast.ME_Add (lhs, term) ->
      check_math_expr lhs;
      check_term term
  | Ast.ME_Sub (lhs, term) ->
      check_math_expr lhs;
      check_term term
  | Ast.ME_Term term ->
      check_term term

and check_term : Ast.term -> unit = function
  | Ast.T_Mul (t, f) ->
      check_term t;
      check_factor f
  | Ast.T_Div (t, f) ->
      check_term t;
      check_factor f;
      (* prevent literal zero division *)
      (match f with
       | Ast.F_Num 0.0 | Ast.F_Int 0 ->
           raise (Semantic_error "Division by zero literal in formula")
       | _ -> ())
  | Ast.T_Fac f -> check_factor f

and check_factor : Ast.factor -> unit = function
  | Ast.F_Paren expr -> check_math_expr expr
  | Ast.F_Num _ | Ast.F_Int _ -> ()

(* Convert math_object_method to string for variable printing *)
let string_of_math_object_method = function
  | M_Random (low, high, step) -> Printf.sprintf "random(%d,%d,%d)" low high step
  | M_Formula expr             -> check_math_expr expr; "<formula>"
  | M_Real f                   -> string_of_float f
  | M_D s                      -> begin match s with
                                    | Some s -> s
                                    | None -> "" end
  | M_Eval _                   -> "<eval>"
  | M_With _                   -> "<with>"

(* Convert variable to string, handling all cases *)
let string_of_variable = function
  | Var_Value v          -> string_of_value v
  | Var_Method m         -> string_of_math_object_method m
  | Var_Field (name, m)  -> name ^ "->" ^ string_of_math_object_method m
  | Var_Chain (m1, m2)   ->
      string_of_math_object_method m1 ^ "->" ^ string_of_math_object_method m2

(* Check that context name is valid *)
let check_context_name name =
  if not (List.mem name allowed_contexts) then
    raise (Semantic_error ("Invalid context name: " ^ name))

(* Check loaded macros are in the allowed list *)
let rec collect_macros = function
  | Macro_Atom s     -> [s]
  | Macro_Cons (s,m) -> s :: collect_macros m

let check_macro_option = function
  | None -> ()
  | Some m ->
      let names = collect_macros m in
      List.iter (fun s ->
        if not (List.mem s allowed_macros) then
          raise (Semantic_error ("Invalid macro file: " ^ s))
      ) names

(* Check module-method combinations according to semantics rules *)
let check_module_method m meth =
  match m, meth with
  | Variables, CM_Are _ -> ()
  | Constants, CM_Add _ -> ()
  | Strings,   CM_Add _ -> ()
  | Operators, (CM_Undefine _ | CM_Redefine _) -> ()
  | _ ->
      let m_str = string_of_module m in
      let meth_str = string_of_context_method meth in
      raise (Semantic_error
        (Printf.sprintf
          "Context method '%s' is not allowed in module '%s'" meth_str m_str))

(* Traverse context configuration list *)
let rec check_context_config = function
  | Cfg_Last (m, meth) -> check_module_method m meth
  | Cfg_Cons (m, meth, rest) ->
      check_module_method m meth;
      check_context_config rest

(* Check the context setup section *)
let check_context_setup = function
  | Context_Only name ->
      check_context_name name
  | Context_With_Config (name, cfg) ->
      check_context_name name;
      check_context_config cfg

(* Evaluate a math_expr to a float *)
let rec eval_math_expr = function
  | Ast.ME_Add (lhs, t) -> eval_math_expr lhs +. eval_term t
  | Ast.ME_Sub (lhs, t) -> eval_math_expr lhs -. eval_term t
  | Ast.ME_Term t       -> eval_term t

and eval_term = function
  | Ast.T_Mul (t, f) -> eval_term t *. eval_factor f
  | Ast.T_Div (t, f) -> 
      let dv = eval_factor f in
      if dv = 0. then raise (Semantic_error "Division by zero in evaluation");
      eval_term t /. dv
  | Ast.T_Fac f      -> eval_factor f

and eval_factor = function
  | Ast.F_Paren e -> eval_math_expr e
  | Ast.F_Num n   -> n
  | Ast.F_Int i   -> float_of_int i

let value_of_float f =
  VNum f

let float_of_variable = function
  | Var_Value (VInt i)      -> float_of_int i
  | Var_Value (VNum f)      -> f
  | Var_Method (M_Real f)   -> f
  | Var_Method (M_Formula e) -> eval_math_expr e  (* if you allow formulas as answers *)
  | _ ->
      raise (Semantic_error
        "Cannot compare non-numeric in-text call / answer")

(* Check consistency between intext_call and answer_item *)
let check_question_item = function
  | Q_Item (q_text, answer, _) ->
      let var_of_icall = function
        | IC_VarV v -> Var_Value (value_of_float (float_of_variable v))
        | IC_Math expr -> (* first run the structural checks: *)
                          check_math_expr expr;
                          (* then evaluate and wrap into a variable: *)
                          let f = eval_math_expr expr in
                          Var_Value (value_of_float f)
      in
      let v1 = match q_text with
        | Q_Value ic | Q_IsEqual ic -> var_of_icall ic
      in
      (match answer with
      | A_Var v2 -> let f1 = float_of_variable v1 in
                    let f2 = float_of_variable v2 in 
                    if f1 = f2 then ()
                    else
                      let s1 = string_of_variable v1 in
                      let s2 = string_of_variable v2 in
                      raise (Semantic_error
                        (Printf.sprintf
                          "Mismatch: intext call '%s' does not match answer '%s'" s1 s2)))

(* Entry point for semantic checking of the problem section *)
let check_problem_section = function
  | Problem qlist -> List.iter check_question_item qlist

(* Main entry point: validate an entire document *)
let validate = function
  | Doc_Minimal (LoadMacros opt, ctx_setup, prob_sec) ->
      (* Header *)
      check_macro_option opt;
      (* Context setup *)
      check_context_setup ctx_setup;
      (* Problem section *)
      check_problem_section prob_sec
