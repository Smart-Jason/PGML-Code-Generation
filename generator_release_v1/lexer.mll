{
open Parser
exception LexingError of string
}

let int = '-'?['0'-'9']+
let id = ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']*
let number = [ '0'-'9' ]+ '.' [ '0'-'9' ]*
let macro = ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* ".pl"

rule read = 
  parse
  | [' ' '\t']+                     { read lexbuf }
  | '\n'                            { NEWLINE }

  | "DOCUMENT"                      { DOCUMENT }
  | "ENDDOCUMENT"                   { ENDDOCUMENT }

  | "loadMacros"                    { LOADMACROS }
  | "PGstandard.pl"                 { PGSTANDARD }
  | "MathObjects.pl"                { MATHOBJECTS }
  | "PGML.pl"                       { PGML }

  | "Context"                       { CONTEXT }
  | "add"                           { ADD_METH }
  | "set"                           { SET_METH }
  | "are"                           { ARE_METH }
  | "undefine"                      { UNDEFINE_METH }
  | "redefine"                      { REDEFINE_METH }

  | "[_____]"                       { BLANK }
  | "answer"                        { ANSWER_WORD }
  | "width"                         { WIDTH_WORD }
  | "What"                          { WHAT_WORD }
  | "is"                            { IS_WORD }
  | "the"                           { THE_WORD }
  | "value"                         { VALUE_WORD }
  | "of"                            { OF_WORD }
  | "is"                            { IS_WORD }
  | "equal"                         { EQUAL_WORD }
  | "to"                            { TO_WORD }
  | "?"                             { QUESTION_MARK }

  | "BEGIN_PGML"                    { BEGIN_PGML }
  | "END_PGML"                      { END_PGML }

  | "[`["                           { IT_VAR_OPEN }   (* opens variable in‐text var-with-value *)
  | "[`"                            { IT_MATH_OPEN }   (* opens math expr *)
  | "]`]"                           { IT_VAR_CLOSE }   (* common closer for VAR and VARV *)
  | "`]"                            { IT_MATH_CLOSE }  (* common closer for MATH *)

  | '+'                             { ADD_OP }
  | '-'                             { SUB_OP }
  | '*'                             { MUL_OP }
  | '/'                             { DIV_OP }

  | "=>"                            { FAT_COMMA }
  | "->"                            { ARROW }
  | ','                             { COMMA }
  | ';'                             { SEMI }
  | '('                             { LPAREN }
  | ')'                             { RPAREN }
  | '{'                             { LBRACE }
  | '}'                             { RBRACE }

  | '\"'                            { DOUBLE_QUOTE }
  | '\''                            { SINGLE_QUOTE }
  | '$'                             { NAMING }

  | number                          { NUMBER (float_of_string (Lexing.lexeme lexbuf)) }
  | int                             { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | macro                           { MACRO (Lexing.lexeme lexbuf) }
  | id as x
    { match x with
      | "add"      -> ADD_METH
      | "set"      -> SET_METH
      | "are"      -> ARE_METH
      | "undefine" -> UNDEFINE_METH
      | "redefine" -> REDEFINE_METH
      | "random"   -> RANDOM_METH
      | "Formula"  -> FORMULA_METH
      (*| "Real"     -> REAL_METH*)
      | "D"        -> D_METH
      | "eval"     -> EVAL_METH
      | "with"     -> WITH_METH
      | _          -> ID (Lexing.lexeme lexbuf)
    }

  | "random"                        { RANDOM_METH }
  | "Formula"                       { FORMULA_METH }
  | "Real"                          { REAL_METH }
  | "D"                             { D_METH }
  | "eval"                          { EVAL_METH }
  | "with"                          { WITH_METH }

  | eof                             { EOF }
  | _                               { raise (LexingError "Unexpected character") }