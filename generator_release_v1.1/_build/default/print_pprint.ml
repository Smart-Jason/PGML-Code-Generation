(* print_pprint.ml *)
open PPrint
open Parser   (* bring DCST, CST, Settle into scope *)

class print = object (self)
  inherit [document] CST.reduce as super
  method zero = empty
  method cat  = (^^)
  method text s = string s

  (*───────────────────────────────────────────────────────────────────────*)
  (* basic combinators and defaults                                        *)
  method visit_DOCUMENT               = string "DOCUMENT"
  method visit_ENDDOCUMENT            = string "ENDDOCUMENT"

  method visit_LOADMACROS             = string "loadMacros"
  method visit_PGSTANDARD             = string "PGstandard.pl"
  method visit_MATHOBJECTS            = string "MathObjects.pl"
  method visit_PGML                   = string "PGML.pl"

  method visit_CONTEXT                = string "Context"

  method visit_BEGIN_PGML             = string "BEGIN_PGML"
  method visit_END_PGML               = string "END_PGML"

  method visit_COMMA                  = comma
  method visit_SEMI                   = semi
  method visit_LPAREN                 = lparen
  method visit_RPAREN                 = rparen

  method visit_LBRACE                 = string "{"
  method visit_RBRACE                 = string "}"

  method visit_NEWLINE                = hardline

  method visit_INT (i : int)          = string (string_of_int i)
  method visit_ID (id : string)       = string id
  method visit_NUMBER (n : float)     = let s =
                                          if n = floor n then
                                            (* no fractional part, print as integer *)
                                            string_of_int (int_of_float n)
                                          else
                                            (* has fractional part, print full float *)
                                            string_of_float n
                                        in
                                        string s
  method visit_MACRO (macro : string) = string macro

  method visit_WHAT_WORD           = string "What"
  method visit_VALUE_WORD          = string "value"
  method visit_OF_WORD             = string "of"
  method visit_TO_WORD             = string "to"
  method visit_THE_WORD            = string "the"
  method visit_IS_WORD             = string "is"
  method visit_EQUAL_WORD          = string "equal"
  method visit_ANSWER_WORD         = string "answer"
  method visit_WIDTH_WORD          = string "width"

  method visit_SET_METH            = string "set"
  method visit_ADD_METH            = string "add"
  method visit_ARE_METH            = string "are"
  method visit_UNDEFINE_METH       = string "undefine"
  method visit_REDEFINE_METH       = string "redefine"

  method visit_RANDOM_METH         = string "random"
  method visit_FORMULA_METH        = string "Formula"
  method visit_REAL_METH           = string "Real"
  method visit_D_METH              = string "D"
  method visit_EVAL_METH           = string "eval"
  method visit_WITH_METH           = string "with"

  method visit_NAMING         = string "$"
  method visit_COLON          = string ":"
  method visit_QUESTION_MARK  = string "?"
  method visit_FAT_COMMA      = string "=>"
  method visit_ARROW          = string "->"

  method visit_DOUBLE_QUOTE   = string "\"" 
  method visit_SINGLE_QUOTE   = string "\'"

  method visit_ADD_OP         = string "+"
  method visit_SUB_OP         = string "-"
  method visit_MUL_OP         = string "*"
  method visit_DIV_OP         = string "/"
  
  method visit_EOF            = string ""

  method visit_BLANK          = string "[_____]"

  method visit_IT_VAR_OPEN    = string "[`["
  method visit_IT_VAR_CLOSE   = string "]`]"
  method visit_IT_MATH_OPEN   = string "[`"
  method visit_IT_MATH_CLOSE  = string "`]"
  
  (*────────────────────────────────────────────────────────────────────────*)
  (* document variants                                                      *)
  method! case_doc_minimal
      hdr ctx prob =
    let hdr_doc  = super#visit_header hdr in
    let ctx_doc  = super#visit_context_setup ctx in
    let prob_doc = super#visit_problem_section prob in
    group (
      self#visit_DOCUMENT ^^ lparen ^^ rparen ^^ semi ^^ hardline
      ^^ hdr_doc
      ^^ ctx_doc
      ^^ prob_doc
      ^^ self#visit_ENDDOCUMENT ^^ lparen ^^ rparen ^^ semi ^^ hardline
    )

  (*─────────────────────────────────────────────────────────────────────────*)
  (* header                                                                  *)
  method! case_header_simple 
      () = 
    string "loadMacros(" ^^ hardline
    ^^ self#visit_DOUBLE_QUOTE ^^ self#visit_PGSTANDARD ^^ self#visit_DOUBLE_QUOTE ^^ comma ^^ hardline
    ^^ self#visit_DOUBLE_QUOTE ^^ self#visit_MATHOBJECTS ^^ self#visit_DOUBLE_QUOTE ^^ comma ^^ hardline
    ^^ self#visit_DOUBLE_QUOTE ^^ self#visit_PGML ^^ self#visit_DOUBLE_QUOTE ^^ hardline
    ^^ string ");" ^^ hardline

  method! case_header_with_macro
      mac =
    let mac_doc = super#visit_macro mac in
    string "loadMacros(" ^^ hardline
    ^^ self#visit_DOUBLE_QUOTE ^^ self#visit_PGSTANDARD ^^ self#visit_DOUBLE_QUOTE ^^ comma ^^ hardline
    ^^ self#visit_DOUBLE_QUOTE ^^ self#visit_MATHOBJECTS ^^ self#visit_DOUBLE_QUOTE ^^ comma ^^ hardline
    ^^ self#visit_DOUBLE_QUOTE ^^ self#visit_PGML ^^ self#visit_DOUBLE_QUOTE ^^ comma ^^ hardline
    ^^ mac_doc
    ^^ string ");" ^^ hardline

  (*─────────────────────────────────────────────────────────────────────────*)
  (* macro                                                                   *)
  method! case_macro_atom
      name =
    string ("\"" ^ name ^ "\"") ^^ hardline

  method! case_macro_cons
      name rest =
    let rest_doc = super#visit_macro rest in
    string ("\"" ^ name ^ "\"") ^^ comma ^^ hardline ^^ rest_doc

  (*─────────────────────────────────────────────────────────────────────────*)
  (* context_setup                                                           *)
  method! case_ctx_only
      cname =
    string "Context(" ^^ string ("\"" ^ cname ^ "\"") ^^ string ");" ^^ hardline

  method! case_ctx_with_cfg
      cname cfg =
    let cfg_doc = super#visit_context_config cfg in
    string "Context(" 
    ^^ string ("\"" ^ cname ^ "\"") 
    ^^ string ");" ^^ hardline
    ^^ cfg_doc

  (*─────────────────────────────────────────────────────────────────────────*)
  (* context_config                                                          *)
  method! case_cfg_last
      modl cm =
    let modl_doc = super#visit_module_ modl in
    let cm_doc   = super#visit_context_method cm in
    string "Context()->" 
    ^^ modl_doc
    ^^ string "->"
    ^^ cm_doc
    ^^ semi ^^ hardline

  method! case_cfg_cons
      modl cm rest =
    let modl_doc = super#visit_module_ modl in
    let cm_doc   = super#visit_context_method cm in
    let rest_doc = super#visit_context_config rest in
    string "Context()->" 
    ^^ modl_doc
    ^^ string "->"
    ^^ cm_doc
    ^^ semi ^^ hardline
    ^^ rest_doc

  (*─────────────────────────────────────────────────────────────────────────*)
  (* context_method                                                          *)
  method! case_cm_add
      entries =
    string "add(" ^^ super#visit_entry_list entries ^^ string ")"

  method! case_cm_set
      entries =
    string "set(" ^^ super#visit_entry_list entries ^^ string ")"

  method! case_cm_are 
      entries = 
    string "are(" ^^ super#visit_entry_list entries ^^ string ")"

  method! case_cm_undefine 
      ops = 
    string "undefine(" ^^ super#visit_operator_list ops ^^ string ")"

  method! case_cm_redefine 
      ops = 
    string "redefine(" ^^ super#visit_operator_list ops ^^ string ")"

  (*─────────────────────────────────────────────────────────────────────────*)
  (* entry, properties, property                                             *)
  method! case_entry_prop
      prop =
    super#visit_property prop

  method! case_entry_map_none
      key = 
    let key_doc   = super#visit_key        key   in
    key_doc ^^ string "=>" ^^ string "{}"

  method! case_entry_map
      key props =
    let key_doc   = super#visit_key        key   in
    let props_doc = super#visit_properties props in
    key_doc ^^ string "=>" ^^ lbrace
    ^^ props_doc
    ^^ rbrace

  method! case_property
      key value =
    super#visit_key   key   ^^
    string "=>"             ^^
    super#visit_value value
  
  (*─────────────────────────────────────────────────────────────────────────*)
  (* key & value                                                             *)
  method! case_key_ident  id    = string id
  method! case_key_str s        = string s

  method! case_value_int     i     = string (string_of_int i)
  method! case_value_num     n     = string (string_of_float n)
  method! case_value_str_dou s     = string ("\"" ^ s ^ "\"")
  method! case_value_ident   id    = string id

  (*─────────────────────────────────────────────────────────────────────────*)
  (* answer_vars & variable_list                                             *)
  method! case_var_value
      v =
    super#visit_value v

  method! case_var_meth 
      m =
    super#visit_math_object_method m

  method! case_var_field 
      id m =
    string "$" ^^ string id ^^ string "->" ^^ super#visit_math_object_method m

  method! case_var_chain 
      m1 m2 =
    super#visit_math_object_method m1 ^^ string "->" ^^ super#visit_math_object_method m2

  (*─────────────────────────────────────────────────────────────────────────*)
  (* math object methods                                                     *)
  method! case_meth_rand
      a b c =
    string "random(" ^^ string (string_of_int a) ^^ comma
    ^^ string (string_of_int b) ^^ comma
    ^^ string (string_of_int c) ^^ string ")"

  method! case_meth_form
      s    = 
      string "Formula(" ^^ string "\"" ^^ (super#visit_math_expr s) ^^ string "\"" ^^ string ")"

  method! case_meth_real
      n    = 
      string "Real(" ^^ self#visit_NUMBER n ^^ string ")"

  method! case_meth_d_none
      ()   = 
      string "D()"

  method! case_meth_d
      u    = 
      string "D('" ^^ string u ^^ string "')"

  method! case_meth_eval
      p    = 
      string "eval(" ^^ super#visit_property p ^^ string ")"

  method! case_meth_with
      p    = 
      string "with(" ^^ super#visit_property p ^^ string ")"

  (*─────────────────────────────────────────────────────────────────────────*)
  (* problem_section & questions                                             *)
  method! case_problem_section
      qs =
    string "BEGIN_PGML" ^^ hardline
    ^^ super#visit_question_list qs
    ^^ string "END_PGML" ^^ hardline

  method! case_qlist
      head tail =
    let head_doc = super#visit_question_item head in
    let tail_doc = super#visit_question_list tail in
    head_doc ^^ hardline ^^ tail_doc

  method! case_qlist_single
      item = 
    super#visit_question_item item ^^ hardline

  method! case_qitem1
      qt   (* : CST.question_text *)
      ans  (* : CST.answer_item  *) =
    super#visit_question_text qt
    ^^ self#visit_BLANK
    ^^ string "{"
    ^^ super#visit_answer_item  ans
    ^^ string "}"
    ^^ hardline

  method! case_qitem2
      qt   (* : CST.question_text *)
      ans  (* : CST.answer_item  *)
      w    (* : float            *) =
    super#visit_question_text qt
    ^^ self#visit_BLANK
    ^^ string "{answer=>"
    ^^ super#visit_answer_item ans
    ^^ string ",width=>"
    ^^ string (string_of_int w)
    ^^ string "}"
    ^^ hardline

  method! case_qvalue
      call =
    let call_doc = super#visit_intext_call call in
    string "What is the value of " ^^ call_doc ^^ string "?"

  method! case_qis
      call =
    let call_doc = super#visit_intext_call call in
    call_doc ^^ string " is equal to "

  (*─────────────────────────────────────────────────────────────────────────*)
  (* answer_item                                                             *)
  method! case_ans_var
      v = super#visit_variable v

  (*─────────────────────────────────────────────────────────────────────────*)
  (* intext_call                                                             *)
  method! case_ict_varv
      v =
    string "[`[" ^^ super#visit_variable v ^^ string "]`]"

  method! case_ict_math
      expr =
    string "[`" ^^ super#visit_math_expr expr ^^ string "`]"

  (*─────────────────────────────────────────────────────────────────────────*)
  (* math_expr, term, factor                                                 *)
  method! case_madd
      l r =
    super#visit_math_expr l
    ^^ string "+"
    ^^ super#visit_term r

  method! case_msub
      l r =
    super#visit_math_expr l
    ^^ string "-"
    ^^ super#visit_term r

  method! case_mterm
      t =
    super#visit_term t

  method! case_tmul
      l f =
    super#visit_term l
    ^^ string "*"
    ^^ super#visit_factor f

  method! case_tdiv
      l f =
    super#visit_term l
    ^^ string "/"
    ^^ super#visit_factor f

  method! case_tfac
      f =
    super#visit_factor f

  method! case_fparen
      e =
    lparen ^^ super#visit_math_expr e ^^ rparen

  method! case_fnum
      n =
    string (string_of_float n)

  method! case_fint
      i =
    string (string_of_int i)

end

let to_doc (cst : CST.main) : PPrint.document =
  (new print)#visit_main cst
