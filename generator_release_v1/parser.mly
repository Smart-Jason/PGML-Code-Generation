/* parser.mly */
%{ 
  open Ast
%}

(* -------------------------------------------------------------------------- *)
(* token declarations                                                         *)
(* -------------------------------------------------------------------------- *)
%token EOF
%token NEWLINE

%token DOCUMENT
%token ENDDOCUMENT

%token LOADMACROS
%token PGSTANDARD MATHOBJECTS PGML
%token CONTEXT

(* for context methods *)
%token ADD_METH
%token SET_METH
%token ARE_METH
%token UNDEFINE_METH
%token REDEFINE_METH

%token RANDOM_METH    (* for the word "random" *)
%token FORMULA_METH   (* for the word "Formula" *)
%token REAL_METH      (* for the word "Real" *)
%token D_METH         (* for the word "D" *)
%token EVAL_METH      (* for the word "eval" *)
%token WITH_METH      (* for the word "with" *)

%token BLANK
%token ANSWER_WORD
%token WIDTH_WORD

%token WHAT_WORD IS_WORD THE_WORD VALUE_WORD OF_WORD EQUAL_WORD TO_WORD QUESTION_MARK

%token BEGIN_PGML
%token END_PGML

%token IT_VAR_OPEN IT_MATH_OPEN IT_VAR_CLOSE IT_MATH_CLOSE

%token DOUBLE_QUOTE
%token SINGLE_QUOTE
%token NAMING
%token ARROW
%token FAT_COMMA

%token COMMA
%token SEMI

%token LPAREN
%token RPAREN

%token LBRACE
%token RBRACE

%token ADD_OP
%token SUB_OP
%token MUL_OP
%token DIV_OP

%token <float> NUMBER
%token <int> INT
%token <string> MACRO
%token <string> ID

%start <Ast.document> main
%%

(* -------------------------------------------------------------------------- *)
(* document (4 variants)                                                      *)
(* -------------------------------------------------------------------------- *)
main:
  | DOCUMENT; LPAREN; RPAREN; SEMI; NEWLINE;
    hdr   = header;
    ctx   = context_setup;
    prob  = problem_section;
    ENDDOCUMENT; LPAREN; RPAREN; SEMI; EOF
      { Doc_Minimal   (hdr, ctx, prob) }
    [@name doc_minimal]

(* -------------------------------------------------------------------------- *)
(* header                                                                     *)
(* -------------------------------------------------------------------------- *)
header:
  | LOADMACROS; LPAREN;
    DOUBLE_QUOTE; PGSTANDARD; DOUBLE_QUOTE; COMMA;
    DOUBLE_QUOTE; MATHOBJECTS; DOUBLE_QUOTE; COMMA;
    DOUBLE_QUOTE; PGML; DOUBLE_QUOTE; COMMA;
    mac = macro;
    RPAREN; SEMI; NEWLINE
      { LoadMacros (Some mac) }
    [@name header_with_macro]

  | LOADMACROS; LPAREN;
    DOUBLE_QUOTE; PGSTANDARD; DOUBLE_QUOTE; COMMA;
    DOUBLE_QUOTE; MATHOBJECTS; DOUBLE_QUOTE; COMMA;
    DOUBLE_QUOTE; PGML; DOUBLE_QUOTE;
    RPAREN; SEMI; NEWLINE
      { LoadMacros (None) }
    [@name header_simple]

(* -------------------------------------------------------------------------- *)
(* macro                                                                      *)
(* -------------------------------------------------------------------------- *)
macro:
  | DOUBLE_QUOTE; name  = MACRO; DOUBLE_QUOTE; COMMA; rest = macro
      { Macro_Cons (name, rest) }
    [@name macro_cons]

  | DOUBLE_QUOTE; name  = MACRO; DOUBLE_QUOTE
      { Macro_Atom (name) }
    [@name macro_atom]

(* -------------------------------------------------------------------------- *)
(* context_setup                                                              *)
(* -------------------------------------------------------------------------- *)
context_setup:
  | CONTEXT; LPAREN; DOUBLE_QUOTE;
    cname = ID; DOUBLE_QUOTE; RPAREN; SEMI; NEWLINE;
    cfg   = context_config
      { Context_With_Config (cname, cfg) }
    [@name ctx_with_cfg]

  | CONTEXT; LPAREN; DOUBLE_QUOTE;
    cname = ID; DOUBLE_QUOTE; RPAREN; SEMI; NEWLINE
      { Context_Only (cname) }
    [@name ctx_only]

(* -------------------------------------------------------------------------- *)
(* context_config                                                             *)
(* -------------------------------------------------------------------------- *)
context_config:
  | CONTEXT; LPAREN; RPAREN; ARROW; modl  = module_; ARROW; cm = context_method; SEMI; NEWLINE; rest = context_config
      { Cfg_Cons  (modl, cm, rest) }
    [@name cfg_cons]

  | CONTEXT; LPAREN; RPAREN; ARROW; modl  = module_; ARROW; cm = context_method; SEMI; NEWLINE
      { Cfg_Last  (modl, cm) }
    [@name cfg_last]

(* -------------------------------------------------------------------------- *)
(* module                                                                     *)
(* -------------------------------------------------------------------------- *)
module_:
  | id = ID
      { match id with
        | "variables" -> Variables
        | "constants" -> Constants
        | "strings"   -> Strings
        | "operators" -> Operators
        | _ -> failwith ("Unknown module: "^id)
      }
    [@name module_]

(* -------------------------------------------------------------------------- *)
(* context_method  (all variants)                                             *)
(* -------------------------------------------------------------------------- *)
context_method:
  | ADD_METH;    LPAREN; entries = entry_list; RPAREN
      { CM_Add       entries }
    [@name cm_add]

  | SET_METH;    LPAREN; entries = entry_list; RPAREN
      { CM_Set       entries }
    [@name cm_set]

  | ARE_METH;    LPAREN; entries = entry_list; RPAREN
      { CM_Are       entries }
    [@name cm_are]

  | UNDEFINE_METH; LPAREN; ops   = operator_list;  RPAREN
      { CM_Undefine   ops     }
    [@name cm_undefine]

  | REDEFINE_METH; LPAREN; ops   = operator_list;  RPAREN
      { CM_Redefine   ops     }
    [@name cm_redefine]

(* -------------------------------------------------------------------------- *)
(* entry_list & entry & properties                                            *)
(* -------------------------------------------------------------------------- *)
entry_list:
  | hd = entry; COMMA; tl = entry_list
      { hd :: tl }
    [@name entry_list]

  | single = entry
      { [single] }
    [@name entry_list_single]

entry:
  | key = key; FAT_COMMA; LBRACE; RBRACE
      { Entry_Map  (key, None) }
    [@name entry_map_none]
  
  | key = key; FAT_COMMA; LBRACE; props = properties; RBRACE
      { Entry_Map  (key, Some props) }
    [@name entry_map]

  | prop = property
      { Entry_Property prop }
    [@name entry_prop]

property:
  | key = key; FAT_COMMA; value = value
      { Property (key, value) }
    [@name property]

properties:
  | hd = property; COMMA; tl = properties
      { hd :: tl }
    [@name properties]

  | single = property
      { [single] }
    [@name properties_single]

(* -------------------------------------------------------------------------- *)
(* key / value / operators                                                    *)
(* -------------------------------------------------------------------------- *)
key:
  | NAMING; id = ID
      { Ident id }
    [@name key_ident]

  | s = ID
      { Str s }
    [@name key_str]

value:
  | i = INT
      { VInt i }
    [@name value_int]

  | n = NUMBER
      { VNum n }
    [@name value_num]

  | DOUBLE_QUOTE; s = ID; DOUBLE_QUOTE
      { VStr s }
    [@name value_str_dou]

  | SINGLE_QUOTE; s = ID; SINGLE_QUOTE
      { VStr s }
    [@name value_str_sin]
  
  | NAMING; id = ID
      { VIdent id }
    [@name value_ident]

operator_list:
  | DOUBLE_QUOTE; hd = operator; DOUBLE_QUOTE; COMMA; tl = operator_list
      { hd :: tl }
    [@name operator_list_dou]
  
  | SINGLE_QUOTE; hd = operator; SINGLE_QUOTE; COMMA; tl = operator_list
      { hd :: tl }
    [@name operator_list_sin]

  | DOUBLE_QUOTE; single = operator; DOUBLE_QUOTE
       { [single] }
     [@name operator_list_single_dou]

  | SINGLE_QUOTE; single = operator; SINGLE_QUOTE
      { [single] }
    [@name operator_list_single_sin]

operator:
  | ADD_OP
      { Add_Op }
    [@name operator_add]

  | SUB_OP
      { Sub_Op }
    [@name operator_sub]

  | MUL_OP
      { Mul_Op }
    [@name operator_mul]

  | DIV_OP
      { Div_Op }
    [@name operator_div]

variable:
  | v = value
      { Var_Value v }
    [@name var_value]

  | meth = math_object_method
      { Var_Method meth }
    [@name var_meth]

  | NAMING; id = ID; ARROW; meth = math_object_method
      { Var_Field (id, meth) }
    [@name var_field]

  | lhs = math_object_method; ARROW; rhs = math_object_method
      { Var_Chain (lhs, rhs) }
    [@name var_chain]

(* -------------------------------------------------------------------------- *)
(* math_object_method                                                         *)
(* -------------------------------------------------------------------------- *)
math_object_method:
  | RANDOM_METH; LPAREN; i1 = INT; COMMA; i2 = INT; COMMA; i3 = INT; RPAREN
      { M_Random (i1, i2, i3) }
    [@name meth_rand]

  | FORMULA_METH; LPAREN; DOUBLE_QUOTE; expr = math_expr; DOUBLE_QUOTE; RPAREN
      { M_Formula expr }
    [@name meth_form]

  | REAL_METH; LPAREN; n = NUMBER; RPAREN
      { M_Real n }
    [@name meth_real]

  | D_METH; LPAREN; RPAREN
      { M_D None }
    [@name meth_d_none]

  | D_METH; LPAREN; SINGLE_QUOTE; unknown = ID; SINGLE_QUOTE; RPAREN
      { M_D (Some unknown) }
    [@name meth_d]

  | EVAL_METH; LPAREN; prop = property; RPAREN
      { M_Eval prop }
    [@name meth_eval]

  | WITH_METH; LPAREN; prop = property; RPAREN
      { M_With prop }
    [@name meth_with]

(* -------------------------------------------------------------------------- *)
(* problem_section & questions                                                *)
(* -------------------------------------------------------------------------- *)
problem_section:
  | BEGIN_PGML; NEWLINE; qlist = question_list; END_PGML; NEWLINE
      { Problem qlist }
    [@name problem_section]

question_list:
  | item = question_item; NEWLINE; NEWLINE; rest = question_list
      { item :: rest }  [@name qlist]
  
  | item = question_item; NEWLINE
      { [item] }        [@name qlist_single]

question_item:
  | qtxt = question_text; BLANK; LBRACE; ans = answer_item; RBRACE
      { Q_Item (qtxt, ans, None) }
    [@name qitem1]

  | qtxt = question_text; BLANK; LBRACE; ANSWER_WORD; FAT_COMMA; ans = answer_item; COMMA; WIDTH_WORD; FAT_COMMA; w = INT; RBRACE
      { Q_Item (qtxt, ans, Some w) }
    [@name qitem2]

question_text:
  | WHAT_WORD; IS_WORD; THE_WORD; VALUE_WORD; OF_WORD; call = intext_call; QUESTION_MARK
      { Q_Value call }
    [@name qvalue]

  | call = intext_call; IS_WORD; EQUAL_WORD; TO_WORD
      { Q_IsEqual call }
    [@name qis]

answer_item:
  | v = variable
      { A_Var v }
    [@name ans_var]

(* -------------------------------------------------------------------------- *)
(* inline calls & math expressions                                            *)
(* -------------------------------------------------------------------------- *)
intext_call:
  | IT_VAR_OPEN; v = variable; IT_VAR_CLOSE
      { IC_VarV v }
    [@name ict_varv]

  | IT_MATH_OPEN; expr = math_expr; IT_MATH_CLOSE
      { IC_Math expr }
    [@name ict_math]

math_expr:
  | left = math_expr; op = ADD_OP; t = term
      { ME_Add (left, t) }
    [@name madd]

  | left = math_expr; op = SUB_OP; t = term
      { ME_Sub (left, t) }
    [@name msub]

  | t = term
      { ME_Term t }
    [@name mterm]

term:
  | left = term; op = MUL_OP; f = factor
      { T_Mul (left, f) }
    [@name tmul]

  | left = term; op = DIV_OP; f = factor
      { T_Div (left, f) }
    [@name tdiv]

  | f = factor
      { T_Fac f }
    [@name tfac]

factor:
  | LPAREN; e = math_expr; RPAREN
      { F_Paren e }
    [@name fparen]

  | n = NUMBER
      { F_Num n }
    [@name fnum]
  
  | n = INT
      { F_Int n }
    [@name fint]
