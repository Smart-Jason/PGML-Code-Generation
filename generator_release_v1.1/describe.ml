open Ast
open Parser        (* bring DCST, CST, Settle, etc. into scope *)

(* convert AST.module_ to DCST.module_ *)
let describe_module modu = 
  prerr_endline "→ describe_module";
  match modu with
  | Variables -> DCST.module_ "variables"
  | Constants -> DCST.module_ "constants"
  | Strings   -> DCST.module_ "strings"
  | Operators -> DCST.module_ "operators"

let rec dcst_of_entries = function
  | [x]       -> DCST.entry_list_single x
  | x :: xs   -> DCST.entry_list x (dcst_of_entries xs)
  | []        -> invalid_arg "entry_list must be non‐empty"

let dcst_of_operator (s : operator) : DCST.operator =
  match s with
  | Add_Op   -> DCST.operator_add ()
  | Sub_Op   -> DCST.operator_sub ()
  | Mul_Op   -> DCST.operator_mul ()
  | Div_Op   -> DCST.operator_div ()

let rec dcst_of_operator_list = function
  | [s]    -> DCST.operator_list_single_sin (dcst_of_operator s)
  | s::ss  -> DCST.operator_list_sin (dcst_of_operator s) (dcst_of_operator_list ss)
  | []     -> invalid_arg "operator_list must be non‐empty"

let rec dcst_of_properties = function
  | [p]      -> DCST.properties_single p
  | p :: ps  -> DCST.properties p (dcst_of_properties ps)
  | []       -> invalid_arg "describe: empty properties"

let rec dcst_of_question_list = function
  | [q]     -> DCST.qlist_single q
  | q :: qs -> DCST.qlist q (dcst_of_question_list qs)
  | []      -> invalid_arg "describe: empty question_list"

let rec describe_document doc = 
  prerr_endline "→ describe_document";
  match doc with
  | Doc_Minimal (hdr, ctx, prob) ->
      DCST.doc_minimal
        (describe_header hdr)
        (describe_context_setup ctx)
        (describe_problem_section prob)

and describe_header header = 
  prerr_endline "→ describe_header";
  match header with
  | LoadMacros (None) -> DCST.header_simple ()
  | LoadMacros (Some mac) -> DCST.header_with_macro (describe_macro mac)

and describe_macro macro = 
  prerr_endline "→ describe_macro";
  match macro with
  | Macro_Atom name       -> DCST.macro_atom name
  | Macro_Cons (n, rest)  -> DCST.macro_cons n (describe_macro rest)

and describe_context_setup context_setup = 
  prerr_endline "→ describe_context_setup";
  match context_setup with
  | Context_Only name            -> DCST.ctx_only name
  | Context_With_Config (n, cfg) -> DCST.ctx_with_cfg n (describe_context_config cfg)

and describe_context_config context_config = 
  prerr_endline "→ describe_context_config";
  match context_config with
  | Cfg_Last (m, cm)       ->
      DCST.cfg_last (describe_module m) (describe_context_method cm)
  | Cfg_Cons (m, cm, rest) ->
      DCST.cfg_cons (describe_module m)
                  (describe_context_method cm)
                  (describe_context_config rest)

and describe_context_method context_method = 
  prerr_endline "→ describe_context_method";
  match context_method with
  | CM_Add entries      -> DCST.cm_add (dcst_of_entries (List.map describe_entry entries))
  | CM_Set entries      -> DCST.cm_set (dcst_of_entries (List.map describe_entry entries))
  | CM_Are entries      -> DCST.cm_are (dcst_of_entries (List.map describe_entry entries))
  | CM_Undefine ops     -> DCST.cm_undefine (dcst_of_operator_list ops)
  | CM_Redefine ops     -> DCST.cm_redefine (dcst_of_operator_list ops)

and describe_property prop =
  prerr_endline "→ describe_property";
  match prop with
  | Property (k,v) -> DCST.property (describe_key k) (describe_value v)

and describe_entry entry = 
  prerr_endline "→ describe_entry";
  match entry with
  | Entry_Property prop -> DCST.entry_prop (describe_property prop)
  | Entry_Map  (k, ps)  -> begin match (k, ps) with
                          | (k, None)  -> DCST.entry_map_none (describe_key k)
                          | (k, Some ps) -> let props = List.map describe_property ps in
                                            DCST.entry_map
                                              (describe_key k)
                                              (dcst_of_properties props)
                        end

and describe_key key = 
  prerr_endline "→ describe_key";
  match key with
  | Ident id           -> DCST.key_ident id
  | Str   s            -> DCST.key_str s

and describe_value value = 
  prerr_endline "→ describe_value";
  match value with
  | VInt i             -> DCST.value_int i
  | VNum n             -> DCST.value_num n
  | VStr s             -> DCST.value_str_dou s
  | VIdent id          -> DCST.value_ident id

and describe_variable variable = 
  prerr_endline "→ describe_variable";
  match variable with
  | Var_Value v         -> DCST.var_value (describe_value v)
  | Var_Method (m)      -> DCST.var_meth (describe_math_object_method m)
  | Var_Field (id,m)    -> DCST.var_field id (describe_math_object_method m)
  | Var_Chain (l,r)     -> DCST.var_chain (describe_math_object_method l) (describe_math_object_method r)

and describe_math_object_method mometh = 
  prerr_endline "→ describe_math_object_method";
  match mometh with
  | M_Random       (a,b,c) -> DCST.meth_rand a b c
  | M_Formula      s       -> DCST.meth_form (describe_math_expr s)
  | M_Real         n       -> DCST.meth_real n
  | M_D            u       -> begin match u with 
                              | None   -> DCST.meth_d_none ()
                              | Some u -> DCST.meth_d u
                            end
  | M_Eval         p       -> DCST.meth_eval (describe_property p)
  | M_With         p       -> DCST.meth_with (describe_property p)

and describe_problem_section problem_section = 
  prerr_endline "→ describe_problem_section";
  match problem_section with
  | Problem qs ->
      let qds = List.map describe_question_item qs in
      DCST.problem_section (dcst_of_question_list qds)

and describe_question_item question_item = 
  prerr_endline "→ describe_question_item";
  match question_item with
  | Q_Item (qt, a, Some w) ->
      DCST.qitem2 (describe_question_text qt)
                  (describe_answer_item a) w
  | Q_Item (qt, a, None ) ->
      DCST.qitem1 (describe_question_text qt)
                  (describe_answer_item a)

and describe_question_text question_text = 
  prerr_endline "→ describe_question_text";
  match question_text with
  | Q_Value    c  -> DCST.qvalue    (describe_intext_call c)
  | Q_IsEqual  c  -> DCST.qis       (describe_intext_call c)

and describe_answer_item answer_item = 
  prerr_endline "→ describe_answer_item";
  match answer_item with
  | A_Var var     -> DCST.ans_var (describe_variable var)

and describe_intext_call intext_call = 
  prerr_endline "→ describe_intext_call";
  match intext_call with
  | IC_VarV  v     -> DCST.ict_varv (describe_variable v)
  | IC_Math  e     -> DCST.ict_math (describe_math_expr e)

and describe_math_expr math_expr = 
  prerr_endline "→ describe_math_expr";
  match math_expr with
  | ME_Add (l,r)  -> DCST.madd (describe_math_expr l) (describe_term r)
  | ME_Sub (l,r)  -> DCST.msub (describe_math_expr l) (describe_term r)
  | ME_Term t     -> DCST.mterm (describe_term t)

and describe_term term = 
  prerr_endline "→ describe_term";
  match term with
  | T_Mul (l,r)   -> DCST.tmul (describe_term l) (describe_factor r)
  | T_Div (l,r)   -> DCST.tdiv (describe_term l) (describe_factor r)
  | T_Fac f       -> DCST.tfac (describe_factor f)

and describe_factor factor = 
  prerr_endline "→ describe_factor";
  match factor with
  | F_Paren e     -> DCST.fparen (describe_math_expr e)
  | F_Num   n     -> DCST.fnum n
  | F_Int   i     -> DCST.fint i
