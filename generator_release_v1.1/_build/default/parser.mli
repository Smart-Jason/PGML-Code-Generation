
(* The type of tokens. *)

type token = 
  | WITH_METH
  | WIDTH_WORD
  | WHAT_WORD
  | VALUE_WORD
  | UNDEFINE_METH
  | TO_WORD
  | THE_WORD
  | SUB_OP
  | SINGLE_QUOTE
  | SET_METH
  | SEMI
  | RPAREN
  | REDEFINE_METH
  | REAL_METH
  | RBRACE
  | RANDOM_METH
  | QUESTION_MARK
  | PGSTANDARD
  | PGML
  | OF_WORD
  | NUMBER of (float)
  | NEWLINE
  | NAMING
  | MUL_OP
  | MATHOBJECTS
  | MACRO of (string)
  | LPAREN
  | LOADMACROS
  | LBRACE
  | IT_VAR_OPEN
  | IT_VAR_CLOSE
  | IT_MATH_OPEN
  | IT_MATH_CLOSE
  | IS_WORD
  | INT of (int)
  | ID of (string)
  | FORMULA_METH
  | FAT_COMMA
  | EVAL_METH
  | EQUAL_WORD
  | EOF
  | END_PGML
  | ENDDOCUMENT
  | D_METH
  | DOUBLE_QUOTE
  | DOCUMENT
  | DIV_OP
  | CONTEXT
  | COMMA
  | BLANK
  | BEGIN_PGML
  | ARROW
  | ARE_METH
  | ANSWER_WORD
  | ADD_OP
  | ADD_METH

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.document)

module MenhirInterpreter : sig
  
  (* The incremental API. *)
  
  include MenhirLib.IncrementalEngine.INCREMENTAL_ENGINE
    with type token = token
  
end

(* The entry point(s) to the incremental API. *)

module Incremental : sig
  
  val main: Lexing.position -> (Ast.document) MenhirInterpreter.checkpoint
  
end

(* The unparsing API. *)

module DCST : sig
  
  (* The type of DCSTs for the nonterminal symbol [answer_item]. *)
  
  type answer_item
  
  (* The type of DCSTs for the nonterminal symbol [context_config]. *)
  
  type context_config
  
  (* The type of DCSTs for the nonterminal symbol [context_method]. *)
  
  type context_method
  
  (* The type of DCSTs for the nonterminal symbol [context_setup]. *)
  
  type context_setup
  
  (* The type of DCSTs for the nonterminal symbol [entry]. *)
  
  type entry
  
  (* The type of DCSTs for the nonterminal symbol [entry_list]. *)
  
  type entry_list
  
  (* The type of DCSTs for the nonterminal symbol [factor]. *)
  
  type factor
  
  (* The type of DCSTs for the nonterminal symbol [header]. *)
  
  type header
  
  (* The type of DCSTs for the nonterminal symbol [intext_call]. *)
  
  type intext_call
  
  (* The type of DCSTs for the nonterminal symbol [key]. *)
  
  type key
  
  (* The type of DCSTs for the nonterminal symbol [macro]. *)
  
  type macro
  
  (* The type of DCSTs for the nonterminal symbol [main]. *)
  
  type main
  
  (* The type of DCSTs for the nonterminal symbol [math_expr]. *)
  
  type math_expr
  
  (* The type of DCSTs for the nonterminal symbol [math_object_method]. *)
  
  type math_object_method
  
  (* The type of DCSTs for the nonterminal symbol [module_]. *)
  
  type module_
  
  (* The type of DCSTs for the nonterminal symbol [operator]. *)
  
  type operator
  
  (* The type of DCSTs for the nonterminal symbol [operator_list]. *)
  
  type operator_list
  
  (* The type of DCSTs for the nonterminal symbol [problem_section]. *)
  
  type problem_section
  
  (* The type of DCSTs for the nonterminal symbol [properties]. *)
  
  type properties
  
  (* The type of DCSTs for the nonterminal symbol [property]. *)
  
  type property
  
  (* The type of DCSTs for the nonterminal symbol [question_item]. *)
  
  type question_item
  
  (* The type of DCSTs for the nonterminal symbol [question_list]. *)
  
  type question_list
  
  (* The type of DCSTs for the nonterminal symbol [question_text]. *)
  
  type question_text
  
  (* The type of DCSTs for the nonterminal symbol [term]. *)
  
  type term
  
  (* The type of DCSTs for the nonterminal symbol [value]. *)
  
  type value
  
  (* The type of DCSTs for the nonterminal symbol [variable]. *)
  
  type variable
  
  (* The binary choice constructor at type [answer_item]. *)
  
  val answer_item_choice: answer_item -> answer_item -> answer_item
  
  (* answer_item -> variable *)
  
  val ans_var: variable -> answer_item
  
  (* The binary choice constructor at type [context_config]. *)
  
  val context_config_choice: context_config -> context_config -> context_config
  
  (* context_config -> CONTEXT LPAREN RPAREN ARROW module_ ARROW context_method SEMI NEWLINE context_config *)
  
  val cfg_cons: module_ -> context_method -> context_config -> context_config
  
  (* context_config -> CONTEXT LPAREN RPAREN ARROW module_ ARROW context_method SEMI NEWLINE *)
  
  val cfg_last: module_ -> context_method -> context_config
  
  (* The binary choice constructor at type [context_method]. *)
  
  val context_method_choice: context_method -> context_method -> context_method
  
  (* context_method -> ADD_METH LPAREN entry_list RPAREN *)
  
  val cm_add: entry_list -> context_method
  
  (* context_method -> SET_METH LPAREN entry_list RPAREN *)
  
  val cm_set: entry_list -> context_method
  
  (* context_method -> ARE_METH LPAREN entry_list RPAREN *)
  
  val cm_are: entry_list -> context_method
  
  (* context_method -> UNDEFINE_METH LPAREN operator_list RPAREN *)
  
  val cm_undefine: operator_list -> context_method
  
  (* context_method -> REDEFINE_METH LPAREN operator_list RPAREN *)
  
  val cm_redefine: operator_list -> context_method
  
  (* The binary choice constructor at type [context_setup]. *)
  
  val context_setup_choice: context_setup -> context_setup -> context_setup
  
  (* context_setup -> CONTEXT LPAREN DOUBLE_QUOTE ID DOUBLE_QUOTE RPAREN SEMI NEWLINE context_config *)
  
  val ctx_with_cfg: (string) -> context_config -> context_setup
  
  (* context_setup -> CONTEXT LPAREN DOUBLE_QUOTE ID DOUBLE_QUOTE RPAREN SEMI NEWLINE *)
  
  val ctx_only: (string) -> context_setup
  
  (* The binary choice constructor at type [entry]. *)
  
  val entry_choice: entry -> entry -> entry
  
  (* entry -> key FAT_COMMA LBRACE RBRACE *)
  
  val entry_map_none: key -> entry
  
  (* entry -> key FAT_COMMA LBRACE properties RBRACE *)
  
  val entry_map: key -> properties -> entry
  
  (* entry -> property *)
  
  val entry_prop: property -> entry
  
  (* The binary choice constructor at type [entry_list]. *)
  
  val entry_list_choice: entry_list -> entry_list -> entry_list
  
  (* entry_list -> entry COMMA entry_list *)
  
  val entry_list: entry -> entry_list -> entry_list
  
  (* entry_list -> entry *)
  
  val entry_list_single: entry -> entry_list
  
  (* The binary choice constructor at type [factor]. *)
  
  val factor_choice: factor -> factor -> factor
  
  (* factor -> LPAREN math_expr RPAREN *)
  
  val fparen: math_expr -> factor
  
  (* factor -> NUMBER *)
  
  val fnum: (float) -> factor
  
  (* factor -> INT *)
  
  val fint: (int) -> factor
  
  (* The binary choice constructor at type [header]. *)
  
  val header_choice: header -> header -> header
  
  (* header -> LOADMACROS LPAREN DOUBLE_QUOTE PGSTANDARD DOUBLE_QUOTE COMMA DOUBLE_QUOTE MATHOBJECTS DOUBLE_QUOTE COMMA DOUBLE_QUOTE PGML DOUBLE_QUOTE COMMA macro RPAREN SEMI NEWLINE *)
  
  val header_with_macro: macro -> header
  
  (* header -> LOADMACROS LPAREN DOUBLE_QUOTE PGSTANDARD DOUBLE_QUOTE COMMA DOUBLE_QUOTE MATHOBJECTS DOUBLE_QUOTE COMMA DOUBLE_QUOTE PGML DOUBLE_QUOTE RPAREN SEMI NEWLINE *)
  
  val header_simple: unit -> header
  
  (* The binary choice constructor at type [intext_call]. *)
  
  val intext_call_choice: intext_call -> intext_call -> intext_call
  
  (* intext_call -> IT_VAR_OPEN variable IT_VAR_CLOSE *)
  
  val ict_varv: variable -> intext_call
  
  (* intext_call -> IT_MATH_OPEN math_expr IT_MATH_CLOSE *)
  
  val ict_math: math_expr -> intext_call
  
  (* The binary choice constructor at type [key]. *)
  
  val key_choice: key -> key -> key
  
  (* key -> NAMING ID *)
  
  val key_ident: (string) -> key
  
  (* key -> ID *)
  
  val key_str: (string) -> key
  
  (* The binary choice constructor at type [macro]. *)
  
  val macro_choice: macro -> macro -> macro
  
  (* macro -> DOUBLE_QUOTE MACRO DOUBLE_QUOTE COMMA macro *)
  
  val macro_cons: (string) -> macro -> macro
  
  (* macro -> DOUBLE_QUOTE MACRO DOUBLE_QUOTE *)
  
  val macro_atom: (string) -> macro
  
  (* The binary choice constructor at type [main]. *)
  
  val main_choice: main -> main -> main
  
  (* main -> DOCUMENT LPAREN RPAREN SEMI NEWLINE header context_setup problem_section ENDDOCUMENT LPAREN RPAREN SEMI EOF *)
  
  val doc_minimal: header -> context_setup -> problem_section -> main
  
  (* The binary choice constructor at type [math_expr]. *)
  
  val math_expr_choice: math_expr -> math_expr -> math_expr
  
  (* math_expr -> math_expr ADD_OP term *)
  
  val madd: math_expr -> term -> math_expr
  
  (* math_expr -> math_expr SUB_OP term *)
  
  val msub: math_expr -> term -> math_expr
  
  (* math_expr -> term *)
  
  val mterm: term -> math_expr
  
  (* The binary choice constructor at type [math_object_method]. *)
  
  val math_object_method_choice: math_object_method -> math_object_method -> math_object_method
  
  (* math_object_method -> RANDOM_METH LPAREN INT COMMA INT COMMA INT RPAREN *)
  
  val meth_rand: (int) -> (int) -> (int) -> math_object_method
  
  (* math_object_method -> FORMULA_METH LPAREN DOUBLE_QUOTE math_expr DOUBLE_QUOTE RPAREN *)
  
  val meth_form: math_expr -> math_object_method
  
  (* math_object_method -> REAL_METH LPAREN NUMBER RPAREN *)
  
  val meth_real: (float) -> math_object_method
  
  (* math_object_method -> D_METH LPAREN RPAREN *)
  
  val meth_d_none: unit -> math_object_method
  
  (* math_object_method -> D_METH LPAREN SINGLE_QUOTE ID SINGLE_QUOTE RPAREN *)
  
  val meth_d: (string) -> math_object_method
  
  (* math_object_method -> EVAL_METH LPAREN property RPAREN *)
  
  val meth_eval: property -> math_object_method
  
  (* math_object_method -> WITH_METH LPAREN property RPAREN *)
  
  val meth_with: property -> math_object_method
  
  (* The binary choice constructor at type [module_]. *)
  
  val module__choice: module_ -> module_ -> module_
  
  (* module_ -> ID *)
  
  val module_: (string) -> module_
  
  (* The binary choice constructor at type [operator]. *)
  
  val operator_choice: operator -> operator -> operator
  
  (* operator -> ADD_OP *)
  
  val operator_add: unit -> operator
  
  (* operator -> SUB_OP *)
  
  val operator_sub: unit -> operator
  
  (* operator -> MUL_OP *)
  
  val operator_mul: unit -> operator
  
  (* operator -> DIV_OP *)
  
  val operator_div: unit -> operator
  
  (* The binary choice constructor at type [operator_list]. *)
  
  val operator_list_choice: operator_list -> operator_list -> operator_list
  
  (* operator_list -> DOUBLE_QUOTE operator DOUBLE_QUOTE COMMA operator_list *)
  
  val operator_list_dou: operator -> operator_list -> operator_list
  
  (* operator_list -> SINGLE_QUOTE operator SINGLE_QUOTE COMMA operator_list *)
  
  val operator_list_sin: operator -> operator_list -> operator_list
  
  (* operator_list -> DOUBLE_QUOTE operator DOUBLE_QUOTE *)
  
  val operator_list_single_dou: operator -> operator_list
  
  (* operator_list -> SINGLE_QUOTE operator SINGLE_QUOTE *)
  
  val operator_list_single_sin: operator -> operator_list
  
  (* The binary choice constructor at type [problem_section]. *)
  
  val problem_section_choice: problem_section -> problem_section -> problem_section
  
  (* problem_section -> BEGIN_PGML NEWLINE question_list END_PGML NEWLINE *)
  
  val problem_section: question_list -> problem_section
  
  (* The binary choice constructor at type [properties]. *)
  
  val properties_choice: properties -> properties -> properties
  
  (* properties -> property COMMA properties *)
  
  val properties: property -> properties -> properties
  
  (* properties -> property *)
  
  val properties_single: property -> properties
  
  (* The binary choice constructor at type [property]. *)
  
  val property_choice: property -> property -> property
  
  (* property -> key FAT_COMMA value *)
  
  val property: key -> value -> property
  
  (* The binary choice constructor at type [question_item]. *)
  
  val question_item_choice: question_item -> question_item -> question_item
  
  (* question_item -> question_text BLANK LBRACE answer_item RBRACE *)
  
  val qitem1: question_text -> answer_item -> question_item
  
  (* question_item -> question_text BLANK LBRACE ANSWER_WORD FAT_COMMA answer_item COMMA WIDTH_WORD FAT_COMMA INT RBRACE *)
  
  val qitem2: question_text -> answer_item -> (int) -> question_item
  
  (* The binary choice constructor at type [question_list]. *)
  
  val question_list_choice: question_list -> question_list -> question_list
  
  (* question_list -> question_item NEWLINE NEWLINE question_list *)
  
  val qlist: question_item -> question_list -> question_list
  
  (* question_list -> question_item NEWLINE *)
  
  val qlist_single: question_item -> question_list
  
  (* The binary choice constructor at type [question_text]. *)
  
  val question_text_choice: question_text -> question_text -> question_text
  
  (* question_text -> WHAT_WORD IS_WORD THE_WORD VALUE_WORD OF_WORD intext_call QUESTION_MARK *)
  
  val qvalue: intext_call -> question_text
  
  (* question_text -> intext_call IS_WORD EQUAL_WORD TO_WORD *)
  
  val qis: intext_call -> question_text
  
  (* The binary choice constructor at type [term]. *)
  
  val term_choice: term -> term -> term
  
  (* term -> term MUL_OP factor *)
  
  val tmul: term -> factor -> term
  
  (* term -> term DIV_OP factor *)
  
  val tdiv: term -> factor -> term
  
  (* term -> factor *)
  
  val tfac: factor -> term
  
  (* The binary choice constructor at type [value]. *)
  
  val value_choice: value -> value -> value
  
  (* value -> INT *)
  
  val value_int: (int) -> value
  
  (* value -> NUMBER *)
  
  val value_num: (float) -> value
  
  (* value -> DOUBLE_QUOTE ID DOUBLE_QUOTE *)
  
  val value_str_dou: (string) -> value
  
  (* value -> SINGLE_QUOTE ID SINGLE_QUOTE *)
  
  val value_str_sin: (string) -> value
  
  (* value -> NAMING ID *)
  
  val value_ident: (string) -> value
  
  (* The binary choice constructor at type [variable]. *)
  
  val variable_choice: variable -> variable -> variable
  
  (* variable -> value *)
  
  val var_value: value -> variable
  
  (* variable -> math_object_method *)
  
  val var_meth: math_object_method -> variable
  
  (* variable -> NAMING ID ARROW math_object_method *)
  
  val var_field: (string) -> math_object_method -> variable
  
  (* variable -> math_object_method ARROW math_object_method *)
  
  val var_chain: math_object_method -> math_object_method -> variable
  
end

module CST : sig
  
  (* The type of CSTs for the nonterminal symbol [answer_item]. *)
  
  type answer_item
  
  (* The type of CSTs for the nonterminal symbol [context_config]. *)
  
  type context_config
  
  (* The type of CSTs for the nonterminal symbol [context_method]. *)
  
  type context_method
  
  (* The type of CSTs for the nonterminal symbol [context_setup]. *)
  
  type context_setup
  
  (* The type of CSTs for the nonterminal symbol [entry]. *)
  
  type entry
  
  (* The type of CSTs for the nonterminal symbol [entry_list]. *)
  
  type entry_list
  
  (* The type of CSTs for the nonterminal symbol [factor]. *)
  
  type factor
  
  (* The type of CSTs for the nonterminal symbol [header]. *)
  
  type header
  
  (* The type of CSTs for the nonterminal symbol [intext_call]. *)
  
  type intext_call
  
  (* The type of CSTs for the nonterminal symbol [key]. *)
  
  type key
  
  (* The type of CSTs for the nonterminal symbol [macro]. *)
  
  type macro
  
  (* The type of CSTs for the nonterminal symbol [main]. *)
  
  type main
  
  (* The type of CSTs for the nonterminal symbol [math_expr]. *)
  
  type math_expr
  
  (* The type of CSTs for the nonterminal symbol [math_object_method]. *)
  
  type math_object_method
  
  (* The type of CSTs for the nonterminal symbol [module_]. *)
  
  type module_
  
  (* The type of CSTs for the nonterminal symbol [operator]. *)
  
  type operator
  
  (* The type of CSTs for the nonterminal symbol [operator_list]. *)
  
  type operator_list
  
  (* The type of CSTs for the nonterminal symbol [problem_section]. *)
  
  type problem_section
  
  (* The type of CSTs for the nonterminal symbol [properties]. *)
  
  type properties
  
  (* The type of CSTs for the nonterminal symbol [property]. *)
  
  type property
  
  (* The type of CSTs for the nonterminal symbol [question_item]. *)
  
  type question_item
  
  (* The type of CSTs for the nonterminal symbol [question_list]. *)
  
  type question_list
  
  (* The type of CSTs for the nonterminal symbol [question_text]. *)
  
  type question_text
  
  (* The type of CSTs for the nonterminal symbol [term]. *)
  
  type term
  
  (* The type of CSTs for the nonterminal symbol [value]. *)
  
  type value
  
  (* The type of CSTs for the nonterminal symbol [variable]. *)
  
  type variable
  
  (* This visitor helps transform concrete syntax trees into something else. *)
  
  class virtual ['r] reduce : object
    
    (* [zero] is an empty piece of output. *)
    
    method virtual zero : 'r
    
    (* [cat] concatenates two pieces of output. *)
    
    method virtual cat : 'r -> 'r -> 'r
    
    (* [text] transforms a string into a piece of output. *)
    
    method virtual text : string -> 'r
    
    (* One method per terminal symbol. *)
    
    method virtual visit_WITH_METH : 'r
    
    method virtual visit_WIDTH_WORD : 'r
    
    method virtual visit_WHAT_WORD : 'r
    
    method virtual visit_VALUE_WORD : 'r
    
    method virtual visit_UNDEFINE_METH : 'r
    
    method virtual visit_TO_WORD : 'r
    
    method virtual visit_THE_WORD : 'r
    
    method virtual visit_SUB_OP : 'r
    
    method virtual visit_SINGLE_QUOTE : 'r
    
    method virtual visit_SET_METH : 'r
    
    method virtual visit_SEMI : 'r
    
    method virtual visit_RPAREN : 'r
    
    method virtual visit_REDEFINE_METH : 'r
    
    method virtual visit_REAL_METH : 'r
    
    method virtual visit_RBRACE : 'r
    
    method virtual visit_RANDOM_METH : 'r
    
    method virtual visit_QUESTION_MARK : 'r
    
    method virtual visit_PGSTANDARD : 'r
    
    method virtual visit_PGML : 'r
    
    method virtual visit_OF_WORD : 'r
    
    method virtual visit_NUMBER : (float) -> 'r
    
    method virtual visit_NEWLINE : 'r
    
    method virtual visit_NAMING : 'r
    
    method virtual visit_MUL_OP : 'r
    
    method virtual visit_MATHOBJECTS : 'r
    
    method virtual visit_MACRO : (string) -> 'r
    
    method virtual visit_LPAREN : 'r
    
    method virtual visit_LOADMACROS : 'r
    
    method virtual visit_LBRACE : 'r
    
    method virtual visit_IT_VAR_OPEN : 'r
    
    method virtual visit_IT_VAR_CLOSE : 'r
    
    method virtual visit_IT_MATH_OPEN : 'r
    
    method virtual visit_IT_MATH_CLOSE : 'r
    
    method virtual visit_IS_WORD : 'r
    
    method virtual visit_INT : (int) -> 'r
    
    method virtual visit_ID : (string) -> 'r
    
    method virtual visit_FORMULA_METH : 'r
    
    method virtual visit_FAT_COMMA : 'r
    
    method virtual visit_EVAL_METH : 'r
    
    method virtual visit_EQUAL_WORD : 'r
    
    method virtual visit_EOF : 'r
    
    method virtual visit_END_PGML : 'r
    
    method virtual visit_ENDDOCUMENT : 'r
    
    method virtual visit_D_METH : 'r
    
    method virtual visit_DOUBLE_QUOTE : 'r
    
    method virtual visit_DOCUMENT : 'r
    
    method virtual visit_DIV_OP : 'r
    
    method virtual visit_CONTEXT : 'r
    
    method virtual visit_COMMA : 'r
    
    method virtual visit_BLANK : 'r
    
    method virtual visit_BEGIN_PGML : 'r
    
    method virtual visit_ARROW : 'r
    
    method virtual visit_ARE_METH : 'r
    
    method virtual visit_ANSWER_WORD : 'r
    
    method virtual visit_ADD_OP : 'r
    
    method virtual visit_ADD_METH : 'r
    
    (* One method per nonterminal symbol. *)
    
    method visit_answer_item : answer_item -> 'r
    
    method visit_context_config : context_config -> 'r
    
    method visit_context_method : context_method -> 'r
    
    method visit_context_setup : context_setup -> 'r
    
    method visit_entry : entry -> 'r
    
    method visit_entry_list : entry_list -> 'r
    
    method visit_factor : factor -> 'r
    
    method visit_header : header -> 'r
    
    method visit_intext_call : intext_call -> 'r
    
    method visit_key : key -> 'r
    
    method visit_macro : macro -> 'r
    
    method visit_main : main -> 'r
    
    method visit_math_expr : math_expr -> 'r
    
    method visit_math_object_method : math_object_method -> 'r
    
    method visit_module_ : module_ -> 'r
    
    method visit_operator : operator -> 'r
    
    method visit_operator_list : operator_list -> 'r
    
    method visit_problem_section : problem_section -> 'r
    
    method visit_properties : properties -> 'r
    
    method visit_property : property -> 'r
    
    method visit_question_item : question_item -> 'r
    
    method visit_question_list : question_list -> 'r
    
    method visit_question_text : question_text -> 'r
    
    method visit_term : term -> 'r
    
    method visit_value : value -> 'r
    
    method visit_variable : variable -> 'r
    
    (* One method per production. *)
    
    method case_var_value : value -> 'r
    
    method case_var_meth : math_object_method -> 'r
    
    method case_var_field : (string) -> math_object_method -> 'r
    
    method case_var_chain : math_object_method -> math_object_method -> 'r
    
    method case_value_int : (int) -> 'r
    
    method case_value_num : (float) -> 'r
    
    method case_value_str_dou : (string) -> 'r
    
    method case_value_str_sin : (string) -> 'r
    
    method case_value_ident : (string) -> 'r
    
    method case_tmul : term -> factor -> 'r
    
    method case_tdiv : term -> factor -> 'r
    
    method case_tfac : factor -> 'r
    
    method case_qvalue : intext_call -> 'r
    
    method case_qis : intext_call -> 'r
    
    method case_qlist : question_item -> question_list -> 'r
    
    method case_qlist_single : question_item -> 'r
    
    method case_qitem1 : question_text -> answer_item -> 'r
    
    method case_qitem2 : question_text -> answer_item -> (int) -> 'r
    
    method case_property : key -> value -> 'r
    
    method case_properties : property -> properties -> 'r
    
    method case_properties_single : property -> 'r
    
    method case_problem_section : question_list -> 'r
    
    method case_operator_list_dou : operator -> operator_list -> 'r
    
    method case_operator_list_sin : operator -> operator_list -> 'r
    
    method case_operator_list_single_dou : operator -> 'r
    
    method case_operator_list_single_sin : operator -> 'r
    
    method case_operator_add : unit -> 'r
    
    method case_operator_sub : unit -> 'r
    
    method case_operator_mul : unit -> 'r
    
    method case_operator_div : unit -> 'r
    
    method case_module_ : (string) -> 'r
    
    method case_meth_rand : (int) -> (int) -> (int) -> 'r
    
    method case_meth_form : math_expr -> 'r
    
    method case_meth_real : (float) -> 'r
    
    method case_meth_d_none : unit -> 'r
    
    method case_meth_d : (string) -> 'r
    
    method case_meth_eval : property -> 'r
    
    method case_meth_with : property -> 'r
    
    method case_madd : math_expr -> term -> 'r
    
    method case_msub : math_expr -> term -> 'r
    
    method case_mterm : term -> 'r
    
    method case_doc_minimal : header -> context_setup -> problem_section -> 'r
    
    method case_macro_cons : (string) -> macro -> 'r
    
    method case_macro_atom : (string) -> 'r
    
    method case_key_ident : (string) -> 'r
    
    method case_key_str : (string) -> 'r
    
    method case_ict_varv : variable -> 'r
    
    method case_ict_math : math_expr -> 'r
    
    method case_header_with_macro : macro -> 'r
    
    method case_header_simple : unit -> 'r
    
    method case_fparen : math_expr -> 'r
    
    method case_fnum : (float) -> 'r
    
    method case_fint : (int) -> 'r
    
    method case_entry_list : entry -> entry_list -> 'r
    
    method case_entry_list_single : entry -> 'r
    
    method case_entry_map_none : key -> 'r
    
    method case_entry_map : key -> properties -> 'r
    
    method case_entry_prop : property -> 'r
    
    method case_ctx_with_cfg : (string) -> context_config -> 'r
    
    method case_ctx_only : (string) -> 'r
    
    method case_cm_add : entry_list -> 'r
    
    method case_cm_set : entry_list -> 'r
    
    method case_cm_are : entry_list -> 'r
    
    method case_cm_undefine : operator_list -> 'r
    
    method case_cm_redefine : operator_list -> 'r
    
    method case_cfg_cons : module_ -> context_method -> context_config -> 'r
    
    method case_cfg_last : module_ -> context_method -> 'r
    
    method case_ans_var : variable -> 'r
    
  end
  
end

module Settle : sig
  
  val main: DCST.main -> CST.main option
  
end
