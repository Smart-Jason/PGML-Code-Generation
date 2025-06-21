(** The type of the abstract syntax tree (AST). *)
type document =
  | Doc_Minimal   of header * context_setup * problem_section

and header =
  | LoadMacros of macro option

and macro =
  | Macro_Cons of string * macro
  | Macro_Atom of string

and context_setup =
  | Context_Only of string
  | Context_With_Config of string * context_config

and context_config =
  | Cfg_Cons of module_ * context_method * context_config
  | Cfg_Last of module_ * context_method

and module_ = Variables | Constants | Strings | Operators

and context_method =
  | CM_Add      of entry_list
  | CM_Set      of entry_list
  | CM_Are      of entry_list
  | CM_Undefine of operator_list
  | CM_Redefine of operator_list

and entry_list = entry list
and entry =
  | Entry_Property of property
  | Entry_Map      of key * properties option

and property = Property of key * value
and properties = property list

and key = Ident of string | Str of string
and value = VInt of int | VNum of float | VStr of string | VIdent of string

and operator_list = operator list
and operator = 
  | Add_Op
  | Sub_Op
  | Mul_Op
  | Div_Op

and variable =
  | Var_Value   of value
  | Var_Method  of math_object_method
  | Var_Field   of string * math_object_method
  | Var_Chain   of math_object_method * math_object_method

and math_object_method =
  | M_Random   of int * int * int
  | M_Formula  of math_expr
  | M_Real     of float
  | M_D        of string option
  | M_Eval     of property
  | M_With     of property

and problem_section = Problem of question_list
and question_list = question_item list
and question_item =
  | Q_Item of question_text * answer_item * int option

and question_text =
  | Q_Value of intext_call
  | Q_IsEqual of intext_call

and answer_item =
  | A_Var   of variable

and intext_call =
  | IC_VarV  of variable
  | IC_Math  of math_expr

and math_expr =
  | ME_Add  of math_expr * term
  | ME_Sub  of math_expr * term
  | ME_Term of term

and term =
  | T_Mul of term * factor
  | T_Div of term * factor
  | T_Fac of factor

and factor =
  | F_Paren of math_expr
  | F_Num   of float
  | F_Int   of int
