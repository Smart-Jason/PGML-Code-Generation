(* ast_printer.ml *)

open Format

(* Helper to print OCaml‐style lists *)
let pp_list pp fmt lst =
  fprintf fmt "[";
  let rec aux = function
    | []    -> ()
    | [x]   -> pp fmt x
    | x::xs ->
        fprintf fmt "%a;@ " pp x;
        aux xs
  in
  aux lst;
  fprintf fmt "]"

let rec pp_document fmt = function
  | Ast.Doc_Minimal (hdr, ctx, prob) ->
      fprintf fmt "Doc_Minimal(%a,@ %a,@ %a)"
        pp_header hdr
        pp_context_setup ctx
        pp_problem_section prob

and pp_header fmt = function
  | Ast.LoadMacros mopt ->
      fprintf fmt "LoadMacros(%a)" pp_macro_option mopt

and pp_macro_option fmt = function
  | None   -> fprintf fmt "None"
  | Some m -> fprintf fmt "Some(%a)" pp_macro m

and pp_macro fmt = function
  | Ast.Macro_Atom s       -> fprintf fmt "Macro_Atom(%S)" s
  | Ast.Macro_Cons (s, m2) -> fprintf fmt "Macro_Cons(%S,@ %a)" s pp_macro m2

and pp_context_setup fmt = function
  | Ast.Context_Only s ->
      fprintf fmt "Context_Only(%S)" s
  | Ast.Context_With_Config (s, cfg) ->
      fprintf fmt "Context_With_Config(%S,@ %a)" s pp_context_config cfg

and pp_context_config fmt = function
  | Ast.Cfg_Last (m, cm) ->
      fprintf fmt "Cfg_Last(%a,@ %a)" pp_module_ m pp_context_method cm
  | Ast.Cfg_Cons (m, cm, rest) ->
      fprintf fmt "Cfg_Cons(%a,@ %a,@ %a)"
        pp_module_ m
        pp_context_method cm
        pp_context_config rest

and pp_module_ fmt = function
  | Ast.Variables -> fprintf fmt "Variables"
  | Ast.Constants -> fprintf fmt "Constants"
  | Ast.Strings   -> fprintf fmt "Strings"
  | Ast.Operators -> fprintf fmt "Operators"

and pp_context_method fmt = function
  | Ast.CM_Add      es   -> fprintf fmt "CM_Add(%a)"      pp_entry_list es
  | Ast.CM_Set      es   -> fprintf fmt "CM_Set(%a)"      pp_entry_list es
  | Ast.CM_Are      es   -> fprintf fmt "CM_Are(%a)"      pp_entry_list es
  | Ast.CM_Undefine ops -> fprintf fmt "CM_Undefine(%a)" pp_operator_list ops
  | Ast.CM_Redefine ops -> fprintf fmt "CM_Redefine(%a)" pp_operator_list ops

and pp_string_opt fmt = function
  | None   -> fprintf fmt "None"
  | Some s -> fprintf fmt "Some(%S)" s

and pp_entry_list fmt = pp_list pp_entry fmt

and pp_entry fmt = function
  | Ast.Entry_Property p -> fprintf fmt "Entry_Property(%a)" pp_property p
  | Ast.Entry_Map (k, ps) -> fprintf fmt "Entry_Map(%a,@ %a)" pp_key k pp_properties_opt ps

and pp_property fmt (Ast.Property (k, v)) =
  fprintf fmt "Property(%a,@ %a)" pp_key k pp_value v

and pp_properties_opt fmt = function
  | None -> fprintf fmt "None"
  | Some props ->
      Format.fprintf fmt "Some [%a]" pp_properties props

and pp_properties fmt = pp_list pp_property fmt

and pp_key fmt = function
  | Ast.Ident s -> fprintf fmt "Ident(%S)" s
  | Ast.Str   s -> fprintf fmt "Str(%S)"   s

and pp_value fmt = function
  | Ast.VInt   i -> fprintf fmt "VInt(%d)"   i
  | Ast.VNum   f -> fprintf fmt "VNum(%f)"   f
  | Ast.VStr   s -> fprintf fmt "VStr(%S)"   s
  | Ast.VIdent s -> fprintf fmt "VIdent(%S)" s

and pp_operator_list fmt = pp_list pp_operator fmt

and pp_operator fmt = function
  | Ast.Add_Op -> fprintf fmt "Add_Op"
  | Ast.Sub_Op -> fprintf fmt "Sub_Op"
  | Ast.Mul_Op -> fprintf fmt "Mul_Op"
  | Ast.Div_Op -> fprintf fmt "Div_Op"

and pp_variable fmt = function
  | Ast.Var_Value v       -> fprintf fmt "Var_Value(%a)"      pp_value v
  | Ast.Var_Method m      -> fprintf fmt "Var_Method(%a)"     pp_math_object_method m
  | Ast.Var_Field (s, m)  -> fprintf fmt "Var_Field(%S,@ %a)" s pp_math_object_method m
  | Ast.Var_Chain (m1,m2) -> fprintf fmt "Var_Chain(%a,@ %a)"  pp_math_object_method m1 pp_math_object_method m2

and pp_math_object_method fmt = function
  | Ast.M_Random (a,b,c) -> fprintf fmt "M_Random(%d,@ %d,@ %d)" a b c
  | Ast.M_Formula expr   -> fprintf fmt "M_Formula(%a)"      pp_math_expr expr
  | Ast.M_Real f         -> fprintf fmt "M_Real(%f)"        f
  | Ast.M_D s            -> fprintf fmt "M_D(@ %a)"         pp_string_opt s
  | Ast.M_Eval p         -> fprintf fmt "M_Eval(%a)"        pp_property p
  | Ast.M_With p         -> fprintf fmt "M_With(%a)"        pp_property p

and pp_problem_section fmt = function
  | Ast.Problem ql ->
      fprintf fmt "Problem(%a)" pp_question_list ql

and pp_question_list fmt = pp_list pp_question_item fmt

and pp_question_item fmt = function
  | Ast.Q_Item (qt, ai, oi) ->
      fprintf fmt "Q_Item(%a,@ %a,@ %a)"
        pp_question_text qt
        pp_answer_item  ai
        pp_int_option   oi

and pp_question_text fmt = function
  | Ast.Q_Value  ic -> fprintf fmt "Q_Value(%a)"   pp_intext_call ic
  | Ast.Q_IsEqual ic -> fprintf fmt "Q_IsEqual(%a)" pp_intext_call ic

and pp_answer_item fmt = function
  | Ast.A_Var v -> fprintf fmt "A_Var(%a)" pp_variable v

and pp_intext_call fmt = function
  | Ast.IC_VarV v -> fprintf fmt "IC_VarV(%a)" pp_variable v
  | Ast.IC_Math e -> fprintf fmt "IC_Math(%a)" pp_math_expr e

and pp_math_expr fmt = function
  | Ast.ME_Add  (e,t) -> fprintf fmt "ME_Add(%a,@ %a)" pp_math_expr e pp_term t
  | Ast.ME_Sub  (e,t) -> fprintf fmt "ME_Sub(%a,@ %a)" pp_math_expr e pp_term t
  | Ast.ME_Term t     -> fprintf fmt "ME_Term(%a)"     pp_term t

and pp_term fmt = function
  | Ast.T_Mul (t,f) -> fprintf fmt "T_Mul(%a,@ %a)" pp_term t pp_factor f
  | Ast.T_Div (t,f) -> fprintf fmt "T_Div(%a,@ %a)" pp_term t pp_factor f
  | Ast.T_Fac f     -> fprintf fmt "T_Fac(%a)"       pp_factor f

and pp_factor fmt = function
  | Ast.F_Paren e -> fprintf fmt "F_Paren(%a)" pp_math_expr e
  | Ast.F_Num   f -> fprintf fmt "F_Num(%f)"   f
  | Ast.F_Int   i -> fprintf fmt "F_Int(%d)"   i

and pp_int_option fmt = function
  | None   -> fprintf fmt "None"
  | Some i -> fprintf fmt "Some(%d)" i
