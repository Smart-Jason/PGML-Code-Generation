(* generator.ml *)
open Ast
open Semantic

(** Compute an int32 random seed from an id string *)
let seed_of_id (id:string) : int =
  let hex = Digest.to_hex (Digest.string id) in
  (* Take the first 8 hex digits and treat them as a 32-bit hex number *)
  let sub = String.sub hex 0 8 in
  (* Convert it to an int *)
  int_of_string ("0x" ^ sub)

(** Randomly select an element from a list *)
let pick lst =
  List.nth lst (Random.int (List.length lst))

(* start from the full list of allowed macros *)
let allowed_macros = ["parserRadioButtons.pl"; "PGcourse.pl"]

(* pick one name out of a nonempty list *)
let pick_one lst =
  List.nth lst (Random.int (List.length lst))

(* generate a macro‐tree without repeats *)
let rec gen_macro_from = function
  | [] -> failwith "internal error: no more macros to pick"
  | [x] -> 
      (* only one left, must end here *)
      Macro_Atom x
  | choices ->
      let x = pick_one choices in
      (* remove x from the leftover choices *)
      let rest = List.filter ((<>) x) choices in
      if Random.bool () then
        (* stop here with a leaf *)
        Macro_Atom x
      else
        (* cons this one on and recurse on the remainder *)
        Macro_Cons (x, gen_macro_from rest)

(* ============== These could be difficulty levels: ================*)

(* The max depth of the context configuration: *)
let max_cfg_depth = 3
let min_cfg_depth = 1

(* The absolute max depth of an expression: *)
let max_expr_depth = 2

(* The maximum amount of questions: *)
let question_num = 5
(* ================================================================ *)

let rec gen_math_expr_root depth : math_expr =
  if depth <= 0 then
    (* terminal case: no more nesting *)
    ME_Term (gen_term 0)
  else
    (* still allowed to nest one level deeper *)
    match Random.int 3 with
    | 0 -> ME_Add (gen_math_expr_root (depth-1), gen_term (depth-1))
    | 1 -> ME_Sub (gen_math_expr_root (depth-1), gen_term (depth-1))
    | _ -> ME_Term (gen_term (depth-1))

and gen_term depth : term =
  if depth <= 0 then
    T_Fac (gen_factor 0)
  else
    match Random.int 3 with
    | 0 -> T_Mul (gen_term (depth-1), gen_factor (depth-1))
    | 1 -> 
        let divisor = gen_factor (depth-1) in
        if is_zero_factor divisor then
         (* re-generate both term and factor to avoid stuck in zero forever *)
          let t = gen_term (depth-1) in
          let d = gen_factor (depth-1) in
          T_Div (t, d)
        else
          T_Div (gen_term (depth-1), divisor)
    | _ -> T_Fac (gen_factor (depth-1))

and is_zero_factor = function
  | F_Int 0       -> true
  | F_Num x       -> x = 0.0
  | _             -> false

and gen_factor depth : factor =
  if depth <= 0 then
    (* force a non‐nested leaf: *)
    (match Random.int 2 with
     | 0 -> F_Int (Random.int 20)
     | _ ->
         (* generate [0.0,20.0), then round to 2 decimals *)
         let raw = Random.float 20.0 in
         let two_dp = floor (raw *. 100. +. 0.5) /. 100. in
         F_Num two_dp)
  else
    (* could even avoid parentheses at max depth if wanted *)
    match Random.int 3 with
    | 0 when max_expr_depth > 0 -> F_Paren (gen_math_expr_root (max_expr_depth-1))
    | 1 -> F_Int   (Random.int 20)
    | _ ->
        (* generate [0.0,20.0), then round to 2 decimals *)
        let raw   = Random.float 20.0 in
        let two_dp = floor (raw *. 100.0 +. 0.5) /. 100.0 in
        F_Num two_dp
      
(* ================================================================ *)
(** Generate a random AST for your <document> nonterminal *)
let rec gen_document () : document =
  match Random.int 4 with
  | _ ->
      Doc_Minimal
        ( gen_header ()
        , gen_context_setup ()
        , gen_problem_section () )

and gen_header () : header =
  (*if Random.bool () then
    LoadMacros (Some (gen_macro ()))
  else*)
    LoadMacros (None)

(* public entry point *)
and gen_macro () : macro =
  gen_macro_from allowed_macros

and gen_context_setup () : context_setup =
  let names =
    [ "Numeric" ]
  in
  let name = pick names in
  (*if Random.bool () then
    Context_Only name*)
  (*else
    Context_With_Config (name, gen_context_config ())*)
    Context_With_Config (name, Cfg_Last(Operators, CM_Undefine([Add_Op; Sub_Op; Mul_Op; Div_Op])))

and gen_context_config () : context_config =
  let modules = [ Variables; Constants; Strings; Operators ] in

  (* pick a random total depth between min and max *)
  let depth = min_cfg_depth + Random.int (max_cfg_depth - min_cfg_depth + 1) in

  (* now build exactly [depth] levels, with the last being Cfg_Last *)
  let rec build i =
    let m  = pick modules in
    let cm = gen_context_method m in
    if i = 1 then
      Cfg_Last (m, cm)
    else
      Cfg_Cons (m, cm, build (i - 1))
  in
  build depth
  
and gen_context_method cmodu : context_method =
  match cmodu with
  | Variables -> pick [
                        (fun () -> CM_Are      (gen_entry_list ()));
                      ] ()
  | Constants -> pick [
                        (fun () -> CM_Add      (gen_entry_list ()));
                      ] ()
  | Strings   -> pick [
                        (fun () -> CM_Add      (gen_entry_list ()));
                      ] ()
  | Operators -> pick [
                        (fun () -> CM_Undefine (gen_operator_list ()));
                        (fun () -> CM_Redefine (gen_operator_list ()));
                      ] ()

and gen_entry_list () : entry list =
  let n = 1 + Random.int 2 in
  let rec aux i acc =
    if i = 0 then acc
    else aux (i - 1) (gen_entry () :: acc)
  in
  aux n []

and gen_entry () : entry =
  if Random.bool () then
    Entry_Property (gen_property ())
  else
    if Random.bool () then
      Entry_Map (gen_key (), Some (gen_properties ()))
    else 
      Entry_Map (gen_key (), None)

and gen_properties () : property list =
  let n = 1 + Random.int 2 in
  let rec aux i acc =
    if i = 0 then acc
    else aux (i - 1) ((gen_property ()) :: acc)
  in
  aux n []

and gen_property () : property =
  Property (gen_key (), gen_value ())

and gen_key () : key =
  match Random.int 2 with
  | 0 -> Ident (pick ["x"; "y"; "z"])
  | _ -> Str   (pick ["True"; "False"; "hello"; "world"])

and gen_value () : value =
  match Random.int 2 with
  | 0 -> VInt (Random.int 20)
  | _ -> (* generate [0.0,20.0), then round to 2 decimals *)
          let raw = Random.float 20.0 in
          let two_dp = floor (raw *. 100.0 +. 0.5) /. 100.0 in
          VNum two_dp

and gen_operator_list () : operator list =
  let opts =
    [Add_Op; Sub_Op; Mul_Op; Div_Op]
  in
  let n = 1 + Random.int 3 in
  let rec aux i acc =
    if i = 0 then acc
    else aux (i - 1) (pick opts :: acc)
  in
  aux n []

and gen_variable () : variable =
  match Random.int 2 with
  | 0 -> Var_Value (gen_value ())
  | _ -> Var_Method (gen_math_object_method ())

and gen_math_object_method () : math_object_method =
  match Random.int 2 with
  | 0 ->
      M_Formula    (gen_math_expr ())
  | _ ->
      (* generate [0.0,20.0), then round to 2 decimals *)
      let raw = Random.float 20.0 in
      let two_dp = floor (raw *. 100.0 +. 0.5) /. 100.0 in
      M_Real two_dp

and gen_problem_section () : problem_section =
  Problem (gen_question_list ())

and gen_question_list () : question_item list =
  let n = 1 + Random.int question_num in
  let rec aux i acc =
    if i = 0 then acc
    else aux (i - 1) (gen_question_item () :: acc)
  in
  aux n []

and gen_question_item () : question_item =
  (* 1) pick exactly one in-text call *)
  let icall = gen_intext_call () in

  (* 2) evaluate it into a variable v_answer *)
  let v_answer =
    match icall with
    | IC_VarV v -> v
    | IC_Math expr ->
        (* run the structural checks on the formula *)
        check_math_expr expr;
        (* evaluate to a float *)
        let f = eval_math_expr expr in
        if f = floor f then
          (* if it’s an exact integer, emit VInt *)
          match Random.int 3 with
          | 0 -> Var_Value (VInt (int_of_float f))
          | 1 -> Var_Method (M_Real f)
          | _ -> Var_Method (M_Formula (ME_Term(T_Fac(F_Int(int_of_float f)))))
        else
          match Random.int 3 with
          | 0 -> Var_Value (VNum f)
          | 1 -> Var_Method (M_Real f)
          | _ -> Var_Method (M_Formula (ME_Term(T_Fac(F_Num f))))
  in

  (* 3) answer is always A_Var v_answer *)
  let ans = A_Var v_answer in

  (* 4) width as before *)
  let width = if Random.bool () then Some (1 + Random.int 10) else None in

  (* 5) choose whether to render Q_Value or Q_IsEqual *)
  let qtext =
    if Random.bool ()
    then Q_Value   icall
    else Q_IsEqual icall
  in

  Q_Item (qtext, ans, width)

and gen_question_text () : question_text =
  if Random.bool () then
    Q_Value   (gen_intext_call ())
  else
    Q_IsEqual (gen_intext_call ())

and gen_answer_item () : answer_item =
  match Random.int 2 with
  | _ -> A_Var (gen_variable ())

and gen_intext_call () : intext_call =
  match Random.int 2 with
  (*| 0 -> IC_VarV (gen_variable ())*)
  | _ -> IC_Math (gen_math_expr ())

(* public entry point: always start at full depth *)
and gen_math_expr () : math_expr =
  gen_math_expr_root max_expr_depth
