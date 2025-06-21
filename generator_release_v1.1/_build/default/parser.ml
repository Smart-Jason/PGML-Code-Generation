
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20240715

module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | NUMBER of (
# 72 "parser.mly"
       (float)
# 40 "parser.ml"
  )
    | NEWLINE
    | NAMING
    | MUL_OP
    | MATHOBJECTS
    | MACRO of (
# 74 "parser.mly"
       (string)
# 49 "parser.ml"
  )
    | LPAREN
    | LOADMACROS
    | LBRACE
    | IT_VAR_OPEN
    | IT_VAR_CLOSE
    | IT_MATH_OPEN
    | IT_MATH_CLOSE
    | IS_WORD
    | INT of (
# 73 "parser.mly"
       (int)
# 62 "parser.ml"
  )
    | ID of (
# 75 "parser.mly"
       (string)
# 67 "parser.ml"
  )
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
  
end

include MenhirBasics

# 2 "parser.mly"
   
  open Ast

# 98 "parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | ADD_METH ->
          56
      | ADD_OP ->
          55
      | ANSWER_WORD ->
          54
      | ARE_METH ->
          53
      | ARROW ->
          52
      | BEGIN_PGML ->
          51
      | BLANK ->
          50
      | COMMA ->
          49
      | CONTEXT ->
          48
      | DIV_OP ->
          47
      | DOCUMENT ->
          46
      | DOUBLE_QUOTE ->
          45
      | D_METH ->
          44
      | ENDDOCUMENT ->
          43
      | END_PGML ->
          42
      | EOF ->
          41
      | EQUAL_WORD ->
          40
      | EVAL_METH ->
          39
      | FAT_COMMA ->
          38
      | FORMULA_METH ->
          37
      | ID _ ->
          36
      | INT _ ->
          35
      | IS_WORD ->
          34
      | IT_MATH_CLOSE ->
          33
      | IT_MATH_OPEN ->
          32
      | IT_VAR_CLOSE ->
          31
      | IT_VAR_OPEN ->
          30
      | LBRACE ->
          29
      | LOADMACROS ->
          28
      | LPAREN ->
          27
      | MACRO _ ->
          26
      | MATHOBJECTS ->
          25
      | MUL_OP ->
          24
      | NAMING ->
          23
      | NEWLINE ->
          22
      | NUMBER _ ->
          21
      | OF_WORD ->
          20
      | PGML ->
          19
      | PGSTANDARD ->
          18
      | QUESTION_MARK ->
          17
      | RANDOM_METH ->
          16
      | RBRACE ->
          15
      | REAL_METH ->
          14
      | REDEFINE_METH ->
          13
      | RPAREN ->
          12
      | SEMI ->
          11
      | SET_METH ->
          10
      | SINGLE_QUOTE ->
          9
      | SUB_OP ->
          8
      | THE_WORD ->
          7
      | TO_WORD ->
          6
      | UNDEFINE_METH ->
          5
      | VALUE_WORD ->
          4
      | WHAT_WORD ->
          3
      | WIDTH_WORD ->
          2
      | WITH_METH ->
          1
  
  and error_terminal =
    0
  
  and token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | ADD_METH ->
          Obj.repr ()
      | ADD_OP ->
          Obj.repr ()
      | ANSWER_WORD ->
          Obj.repr ()
      | ARE_METH ->
          Obj.repr ()
      | ARROW ->
          Obj.repr ()
      | BEGIN_PGML ->
          Obj.repr ()
      | BLANK ->
          Obj.repr ()
      | COMMA ->
          Obj.repr ()
      | CONTEXT ->
          Obj.repr ()
      | DIV_OP ->
          Obj.repr ()
      | DOCUMENT ->
          Obj.repr ()
      | DOUBLE_QUOTE ->
          Obj.repr ()
      | D_METH ->
          Obj.repr ()
      | ENDDOCUMENT ->
          Obj.repr ()
      | END_PGML ->
          Obj.repr ()
      | EOF ->
          Obj.repr ()
      | EQUAL_WORD ->
          Obj.repr ()
      | EVAL_METH ->
          Obj.repr ()
      | FAT_COMMA ->
          Obj.repr ()
      | FORMULA_METH ->
          Obj.repr ()
      | ID _v ->
          Obj.repr _v
      | INT _v ->
          Obj.repr _v
      | IS_WORD ->
          Obj.repr ()
      | IT_MATH_CLOSE ->
          Obj.repr ()
      | IT_MATH_OPEN ->
          Obj.repr ()
      | IT_VAR_CLOSE ->
          Obj.repr ()
      | IT_VAR_OPEN ->
          Obj.repr ()
      | LBRACE ->
          Obj.repr ()
      | LOADMACROS ->
          Obj.repr ()
      | LPAREN ->
          Obj.repr ()
      | MACRO _v ->
          Obj.repr _v
      | MATHOBJECTS ->
          Obj.repr ()
      | MUL_OP ->
          Obj.repr ()
      | NAMING ->
          Obj.repr ()
      | NEWLINE ->
          Obj.repr ()
      | NUMBER _v ->
          Obj.repr _v
      | OF_WORD ->
          Obj.repr ()
      | PGML ->
          Obj.repr ()
      | PGSTANDARD ->
          Obj.repr ()
      | QUESTION_MARK ->
          Obj.repr ()
      | RANDOM_METH ->
          Obj.repr ()
      | RBRACE ->
          Obj.repr ()
      | REAL_METH ->
          Obj.repr ()
      | REDEFINE_METH ->
          Obj.repr ()
      | RPAREN ->
          Obj.repr ()
      | SEMI ->
          Obj.repr ()
      | SET_METH ->
          Obj.repr ()
      | SINGLE_QUOTE ->
          Obj.repr ()
      | SUB_OP ->
          Obj.repr ()
      | THE_WORD ->
          Obj.repr ()
      | TO_WORD ->
          Obj.repr ()
      | UNDEFINE_METH ->
          Obj.repr ()
      | VALUE_WORD ->
          Obj.repr ()
      | WHAT_WORD ->
          Obj.repr ()
      | WIDTH_WORD ->
          Obj.repr ()
      | WITH_METH ->
          Obj.repr ()
  
  and default_reduction =
    (8, "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\021\000\000\000\000\000\026\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000'\000\000\000\000\000)*+(\000\000\000\000\000\000\000,-\000\b\000\000\000\024\025\014\000\000\000\000@>\000A\000\012\000\0001\000\000=\000\000?3\000\r\000\006\000\000\015\000\000\000\t\000\000\000\007\000\000\000\005\000\000\000\003\n\000\000\000\000\000\000\000\000\000\000\000\000&\000\000\000\"\000\000\000\000\000\000\000 \000\000\000\000\000\000\018\000\019\000\000:\000;\000\000\000<\017\000\000\000\000!\000\000\000%\000\000\000\000\000$#D\000\022B\000\000E\000\000\023\0008\000\000\000\000\000\002\000\000\000\000\0005\0004\000\0000\000\000\0006\000\000\0009\000\000\000\000\000\028\001")
  
  and error =
    (57, "\000\000\000\000\000\002\000\000\000\000\b\000\000\000\000\002\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000@\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\b\000\000\000 \000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\016\000\000\000\000\000\000\128\000\000\000\004\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\001\000\000\000\000\000\000\b\000\000\000\016\000\000\000\000\000\000\000\000\000\002\000\000\002\000\000\000\000\016\000\002\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000@\000\000\000\000\000\000\000\000\004\000\000\004\000\000\000\000 \000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\128\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\b\000\000\000\000\000\000\000\000\001\000\000\000\000\000\001\000\000\000\000\000\000\000\000@\000\000@\000\000\000\000\000\000@\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\144\000\000\000\b\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \bH\000\000\000\000\t\000\000\000\016\000\000\000\000 \000\000\000\002\000\000 \000 \000\000@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\b\000\000\000\000@\000 \000\000\000\002\000\000 \000 \000\000@@\000\000\000\000\000\128\000\000\128\000\000\000\004\000\002\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000 \001\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000 \002\130\b\002\000\000\000\000\000\002\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\001\001\000\b\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\016\000\000\000 \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\001\000\020\000@\016\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000@\000\000\000\128\004\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\004\000\000\000\000@\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\001\000\b\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\016\000\128\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000H\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\016\000\000\000\000@\000\000\n\000\000\000\000\000\000\000@\000\000\001\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000P\000\000\004\004(P\001P\192\000\000\000\000\128\000\000\000\000\000\004\000 \000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\001\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\128\000\000\000\000\016\000\000\000\000\000\000\000\000 \000\000\000\000\004\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\004\000\004\000\001 \128\005\000\000\n\016\000\000\000\000\016\000\000\000\000\000\000\000\000\002\000\000\000\001\004\004\000\000\000\000\000\000\000\000\000\000\000\000A\001\000\000\000\000\000\000\000\000\000\000\002 \002\001\000\020\004\000\000\b  \000\000\000\000\000\000\000\000\000\000\000\002\b\b\000\000\000\000\000\000\000\000\000\000\017\000\000\000\000\000 \000\000A\001\000\000\000\004@\004\002\000(\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\016\016\000\000\000D\000@ \002\128\128 \000\000\000\001\000@\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\004\000 \000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\018\000\000\000\000\000\000\000\000\000\001\000\000\000\004\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\016\000\004\130\000\020\000\000(@\000\000\000\000\000\000\000\000\000\000\b  \000\000\000\128\000\000@\000\001\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000 \000\000\001\001\n\020\000T0\b\000\000\000\000\004\000\000@B\133\000\021\012\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\004\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\128\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\b\000\000\128\000 \000\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000 \000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000@\000\000\000\000\016\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000")
  
  and start =
    1
  
  and action =
    ((16, "\000[\000-\000\003\000\024\000\020\000\128\000\134\000d\000\156\000h\000b\000l\000\150\000p\000j\000t\000\174\000|\000\"\000\194\000\176\000\000\000\132\000\172\000\138\000n\000\132\000\000\000\206\000\216\000\198\000\000\000\148\000\192\000\158\000\178\000\162\000\230\000\234\000\214\0000\000\206\000\238\000\160\000\194\000\000\000\164\000\003\000\216\000\136\000\018\000\000\000\000\000\000\000\000\000\254\000\134\000\136\000\018\000\184\000\136\000\136\000\000\000\000\000\252\000\000\000\224\000\\\000\208\000\000\000\000\000\000\000\206\000H\000\212\001\012\000\000\000\000\000\216\000\000\000\\\000\000\000\138\000\\\000\000\000\214\000H\000\000\000\220\000\204\000\000\000\000\001\n\000\000\001\018\000\000\000\142\000\\\000\000\000\246\000\136\001\022\000\000\000\250\000\\\001\026\000\000\000\254\000\\\001\030\000\000\001\"\001\014\000L\000\000\000\000\000\214\001\018\000X\000\252\0014\001<\001\030\000X\000\003\001\018\000\\\0012\000\000\001\022\001$\0018\000\000\001\028\001\014\000\244\001\018\000\248\001\022\001F\000\000\001\024\000\003\000\003\001,\001\n\000\023\000\000\000\023\000\000\000\r\000\023\000\000\000\023\000\000\000.\000\023\000\011\000\000\000\000\000\023\000\026\000$\001N\000\000\0012\000\\\001R\000\000\0016\000\162\001&\001^\001Z\000\000\000\000\000\000\0016\000\000\000\000\000N\000\003\000\000\000\023\000l\000\000\001T\000\000\001\020\001@\000\003\0010\000\003\000\000\001\028\001|\0016\001>\001h\000\000\001j\000\000\0016\001`\000\000\001b\000~\000X\000\000\001L\001B\001\136\000\000\001@\001b\001\130\001\134\001L\000\000\000\000"), (16, "\001\246\000\006\000y\000u\000\194\000\n\000y\000u\001*\001\n\002N\000\014\001\142\002\006\001\001\002\022\002R\000\206\002^\002^\0016\000q\0026\000\018\002V\000q\002r\000y\000u\000N\001\001\002r\000\022\000\210\001^\002~\002B\002^\002\150\000y\000u\002f\002f\002\166\001b\001*\000q\001\222\001\001\000y\000u\002>\001\158\002\254\001\t\001\174\000\214\0016\000q\001:\002f\001F\002r\002\142\000\218\001B\000Z\000i\000q\001\018\001\t\001^\000\166\002\130\001\242\000)\002\222\000\202\002\130\000\185\000\181\001b\001\026\000=\000\197\003>\000\166\002\230\001\t\000\r\002\174\002\214\000\026\002\190\000\030\000\"\000&\000*\000.\0002\0006\000:\000>\000B\000j\000\217\000F\000J\000R\002\130\000V\000^\000b\000\234\000f\000v\000\230\000\246\001N\000z\001\134\000~\000\134\000\138\000\142\000\146\000\150\000\154\000\158\000\162\000\170\000\174\000\178\000\182\000\190\000\198\000\226\000\242\001\006\001\014\001\022\001&\001.\0012\001>\001Z\001f\001j\001v\001~\001\146\001\154\001\162\001\170\001\178\001\186\001\194\001\198\001\214\001\218\001\226\001\230\001\234\001\238\001\250\002\002\002\n\002\014\002\018\002\026\002\030\002\"\002&\002*\002.\0022\002:\002F\002J\002\146\002\154\002\162\002\170\002\178\002\182\002\186\002\202\002\238\002\246\002\250\003\002\003\014\003\018\003\022\003\026\003\030\003&\003.\0032\003:\003J\003N\003R\003Z\003^\003b\003f\003k"))
  
  and lhs =
    (8, "\000\026\025\025\024\024\024\024\024\023\023\022\022\022\021\021\020\020\020\019\019\018\018\017\017\016\016\015\014\014\014\r\r\r\r\r\r\r\012\011\011\011\011\n\n\n\n\t\b\b\007\006\006\005\005\004\004\003\003\003\002\002\002\002\002\001\001\001\001")
  
  and goto =
    ((8, "\029\000\000\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\016\000\000\000\000\0006\000\000\000\000\000\000\000H\000\000\000d\000\000N\000nn\000\000\000\000\000\000rt\000\000x\000\000\000\000\000\015\000\000\000\000\000\138\000\000\000\000\000\000\t\000\0006\000\000\138\000\000\000\000\000\000\000\000\000\000\011\000\000|\000\000\000\002\000\000\000\b\000\000\000\000`\000\000\130\000\002\000\000\000\000rF\000N\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000~\000\000F\000J\000\000r\000t\000\000P\000\000\000X\000\000\000\000\000f\000\000\000\000\000\000\000\000\000\000\000\000\000\000\132\000N\000\000\000\000\000\0004\0008\000\000\000\000\000\000\000\000\000\000\000\000\000\0006\000\000\000\000\000\000\000\000\000\000\000\000"), (8, "H\220HS]\189\203\206H!IHIV_acaI\210\029Ija\028na\194\180\194\180\189\209\206SU\178\180\151\181\151\181\151\158V\210\128\162\181\163u\156\201\185\195\159V\159\168\159\159t/p\159A8@V<?\\fs\214\187\177\153\155\183"))
  
  and semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = v;
          MenhirLib.EngineTypes.startp = _startpos_v_;
          MenhirLib.EngineTypes.endp = _endpos_v_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let v : (Ast.variable) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_v_ in
        let _v : (Ast.answer_item) = 
# 403 "parser.mly"
      ( A_Var v )
# 375 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = rest;
          MenhirLib.EngineTypes.startp = _startpos_rest_;
          MenhirLib.EngineTypes.endp = _endpos_rest_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _9;
            MenhirLib.EngineTypes.startp = _startpos__9_;
            MenhirLib.EngineTypes.endp = _endpos__9_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _8;
              MenhirLib.EngineTypes.startp = _startpos__8_;
              MenhirLib.EngineTypes.endp = _endpos__8_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = cm;
                MenhirLib.EngineTypes.startp = _startpos_cm_;
                MenhirLib.EngineTypes.endp = _endpos_cm_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _6;
                  MenhirLib.EngineTypes.startp = _startpos__6_;
                  MenhirLib.EngineTypes.endp = _endpos__6_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = modl;
                    MenhirLib.EngineTypes.startp = _startpos_modl_;
                    MenhirLib.EngineTypes.endp = _endpos_modl_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _4;
                      MenhirLib.EngineTypes.startp = _startpos__4_;
                      MenhirLib.EngineTypes.endp = _endpos__4_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _3;
                        MenhirLib.EngineTypes.startp = _startpos__3_;
                        MenhirLib.EngineTypes.endp = _endpos__3_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _;
                          MenhirLib.EngineTypes.semv = _2;
                          MenhirLib.EngineTypes.startp = _startpos__2_;
                          MenhirLib.EngineTypes.endp = _endpos__2_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.state = _menhir_s;
                            MenhirLib.EngineTypes.semv = _1;
                            MenhirLib.EngineTypes.startp = _startpos__1_;
                            MenhirLib.EngineTypes.endp = _endpos__1_;
                            MenhirLib.EngineTypes.next = _menhir_stack;
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let rest : (Ast.context_config) = Obj.magic rest in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let cm : (Ast.context_method) = Obj.magic cm in
        let _6 : unit = Obj.magic _6 in
        let modl : (Ast.module_) = Obj.magic modl in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_rest_ in
        let _v : (Ast.context_config) = 
# 145 "parser.mly"
      ( Cfg_Cons  (modl, cm, rest) )
# 463 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _9;
          MenhirLib.EngineTypes.startp = _startpos__9_;
          MenhirLib.EngineTypes.endp = _endpos__9_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _8;
            MenhirLib.EngineTypes.startp = _startpos__8_;
            MenhirLib.EngineTypes.endp = _endpos__8_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = cm;
              MenhirLib.EngineTypes.startp = _startpos_cm_;
              MenhirLib.EngineTypes.endp = _endpos_cm_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _6;
                MenhirLib.EngineTypes.startp = _startpos__6_;
                MenhirLib.EngineTypes.endp = _endpos__6_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = modl;
                  MenhirLib.EngineTypes.startp = _startpos_modl_;
                  MenhirLib.EngineTypes.endp = _endpos_modl_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _4;
                    MenhirLib.EngineTypes.startp = _startpos__4_;
                    MenhirLib.EngineTypes.endp = _endpos__4_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _3;
                      MenhirLib.EngineTypes.startp = _startpos__3_;
                      MenhirLib.EngineTypes.endp = _endpos__3_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _2;
                        MenhirLib.EngineTypes.startp = _startpos__2_;
                        MenhirLib.EngineTypes.endp = _endpos__2_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _menhir_s;
                          MenhirLib.EngineTypes.semv = _1;
                          MenhirLib.EngineTypes.startp = _startpos__1_;
                          MenhirLib.EngineTypes.endp = _endpos__1_;
                          MenhirLib.EngineTypes.next = _menhir_stack;
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let cm : (Ast.context_method) = Obj.magic cm in
        let _6 : unit = Obj.magic _6 in
        let modl : (Ast.module_) = Obj.magic modl in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__9_ in
        let _v : (Ast.context_config) = 
# 149 "parser.mly"
      ( Cfg_Last  (modl, cm) )
# 544 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = entries;
            MenhirLib.EngineTypes.startp = _startpos_entries_;
            MenhirLib.EngineTypes.endp = _endpos_entries_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let entries : (Ast.entry_list) = Obj.magic entries in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.context_method) = 
# 171 "parser.mly"
      ( CM_Add       entries )
# 590 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = entries;
            MenhirLib.EngineTypes.startp = _startpos_entries_;
            MenhirLib.EngineTypes.endp = _endpos_entries_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let entries : (Ast.entry_list) = Obj.magic entries in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.context_method) = 
# 175 "parser.mly"
      ( CM_Set       entries )
# 636 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = entries;
            MenhirLib.EngineTypes.startp = _startpos_entries_;
            MenhirLib.EngineTypes.endp = _endpos_entries_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let entries : (Ast.entry_list) = Obj.magic entries in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.context_method) = 
# 179 "parser.mly"
      ( CM_Are       entries )
# 682 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ops;
            MenhirLib.EngineTypes.startp = _startpos_ops_;
            MenhirLib.EngineTypes.endp = _endpos_ops_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let ops : (Ast.operator_list) = Obj.magic ops in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.context_method) = 
# 183 "parser.mly"
      ( CM_Undefine   ops     )
# 728 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ops;
            MenhirLib.EngineTypes.startp = _startpos_ops_;
            MenhirLib.EngineTypes.endp = _endpos_ops_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let ops : (Ast.operator_list) = Obj.magic ops in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.context_method) = 
# 187 "parser.mly"
      ( CM_Redefine   ops     )
# 774 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = cfg;
          MenhirLib.EngineTypes.startp = _startpos_cfg_;
          MenhirLib.EngineTypes.endp = _endpos_cfg_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _8;
            MenhirLib.EngineTypes.startp = _startpos__8_;
            MenhirLib.EngineTypes.endp = _endpos__8_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _7;
              MenhirLib.EngineTypes.startp = _startpos__7_;
              MenhirLib.EngineTypes.endp = _endpos__7_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _6;
                MenhirLib.EngineTypes.startp = _startpos__6_;
                MenhirLib.EngineTypes.endp = _endpos__6_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _5;
                  MenhirLib.EngineTypes.startp = _startpos__5_;
                  MenhirLib.EngineTypes.endp = _endpos__5_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = cname;
                    MenhirLib.EngineTypes.startp = _startpos_cname_;
                    MenhirLib.EngineTypes.endp = _endpos_cname_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _3;
                      MenhirLib.EngineTypes.startp = _startpos__3_;
                      MenhirLib.EngineTypes.endp = _endpos__3_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _2;
                        MenhirLib.EngineTypes.startp = _startpos__2_;
                        MenhirLib.EngineTypes.endp = _endpos__2_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _menhir_s;
                          MenhirLib.EngineTypes.semv = _1;
                          MenhirLib.EngineTypes.startp = _startpos__1_;
                          MenhirLib.EngineTypes.endp = _endpos__1_;
                          MenhirLib.EngineTypes.next = _menhir_stack;
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let cfg : (Ast.context_config) = Obj.magic cfg in
        let _8 : unit = Obj.magic _8 in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let cname : (
# 75 "parser.mly"
       (string)
# 848 "parser.ml"
        ) = Obj.magic cname in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_cfg_ in
        let _v : (Ast.context_setup) = 
# 132 "parser.mly"
      ( Context_With_Config (cname, cfg) )
# 859 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _8;
          MenhirLib.EngineTypes.startp = _startpos__8_;
          MenhirLib.EngineTypes.endp = _endpos__8_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _7;
            MenhirLib.EngineTypes.startp = _startpos__7_;
            MenhirLib.EngineTypes.endp = _endpos__7_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _6;
              MenhirLib.EngineTypes.startp = _startpos__6_;
              MenhirLib.EngineTypes.endp = _endpos__6_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _5;
                MenhirLib.EngineTypes.startp = _startpos__5_;
                MenhirLib.EngineTypes.endp = _endpos__5_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = cname;
                  MenhirLib.EngineTypes.startp = _startpos_cname_;
                  MenhirLib.EngineTypes.endp = _endpos_cname_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _3;
                    MenhirLib.EngineTypes.startp = _startpos__3_;
                    MenhirLib.EngineTypes.endp = _endpos__3_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _2;
                      MenhirLib.EngineTypes.startp = _startpos__2_;
                      MenhirLib.EngineTypes.endp = _endpos__2_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _menhir_s;
                        MenhirLib.EngineTypes.semv = _1;
                        MenhirLib.EngineTypes.startp = _startpos__1_;
                        MenhirLib.EngineTypes.endp = _endpos__1_;
                        MenhirLib.EngineTypes.next = _menhir_stack;
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _8 : unit = Obj.magic _8 in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let cname : (
# 75 "parser.mly"
       (string)
# 926 "parser.ml"
        ) = Obj.magic cname in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__8_ in
        let _v : (Ast.context_setup) = 
# 137 "parser.mly"
      ( Context_Only (cname) )
# 937 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3;
            MenhirLib.EngineTypes.startp = _startpos__3_;
            MenhirLib.EngineTypes.endp = _endpos__3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = key;
                MenhirLib.EngineTypes.startp = _startpos_key_;
                MenhirLib.EngineTypes.endp = _endpos_key_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let key : (Ast.key) = Obj.magic key in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_key_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.entry) = 
# 204 "parser.mly"
      ( Entry_Map  (key, None) )
# 983 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = props;
            MenhirLib.EngineTypes.startp = _startpos_props_;
            MenhirLib.EngineTypes.endp = _endpos_props_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = key;
                  MenhirLib.EngineTypes.startp = _startpos_key_;
                  MenhirLib.EngineTypes.endp = _endpos_key_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let props : (Ast.properties) = Obj.magic props in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let key : (Ast.key) = Obj.magic key in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_key_ in
        let _endpos = _endpos__5_ in
        let _v : (Ast.entry) = 
# 208 "parser.mly"
      ( Entry_Map  (key, Some props) )
# 1036 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = prop;
          MenhirLib.EngineTypes.startp = _startpos_prop_;
          MenhirLib.EngineTypes.endp = _endpos_prop_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let prop : (Ast.property) = Obj.magic prop in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_prop_ in
        let _endpos = _endpos_prop_ in
        let _v : (Ast.entry) = 
# 212 "parser.mly"
      ( Entry_Property prop )
# 1061 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = tl;
          MenhirLib.EngineTypes.startp = _startpos_tl_;
          MenhirLib.EngineTypes.endp = _endpos_tl_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = hd;
              MenhirLib.EngineTypes.startp = _startpos_hd_;
              MenhirLib.EngineTypes.endp = _endpos_hd_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let tl : (Ast.entry_list) = Obj.magic tl in
        let _2 : unit = Obj.magic _2 in
        let hd : (Ast.entry) = Obj.magic hd in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_hd_ in
        let _endpos = _endpos_tl_ in
        let _v : (Ast.entry_list) = 
# 195 "parser.mly"
      ( hd :: tl )
# 1100 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = single;
          MenhirLib.EngineTypes.startp = _startpos_single_;
          MenhirLib.EngineTypes.endp = _endpos_single_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let single : (Ast.entry) = Obj.magic single in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_single_ in
        let _endpos = _endpos_single_ in
        let _v : (Ast.entry_list) = 
# 199 "parser.mly"
      ( [single] )
# 1125 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let e : (Ast.math_expr) = Obj.magic e in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.factor) = 
# 466 "parser.mly"
      ( F_Paren e )
# 1164 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = n;
          MenhirLib.EngineTypes.startp = _startpos_n_;
          MenhirLib.EngineTypes.endp = _endpos_n_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let n : (
# 72 "parser.mly"
       (float)
# 1185 "parser.ml"
        ) = Obj.magic n in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_n_ in
        let _endpos = _endpos_n_ in
        let _v : (Ast.factor) = 
# 470 "parser.mly"
      ( F_Num n )
# 1193 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = n;
          MenhirLib.EngineTypes.startp = _startpos_n_;
          MenhirLib.EngineTypes.endp = _endpos_n_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let n : (
# 73 "parser.mly"
       (int)
# 1214 "parser.ml"
        ) = Obj.magic n in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_n_ in
        let _endpos = _endpos_n_ in
        let _v : (Ast.factor) = 
# 474 "parser.mly"
      ( F_Int n )
# 1222 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _18;
          MenhirLib.EngineTypes.startp = _startpos__18_;
          MenhirLib.EngineTypes.endp = _endpos__18_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _17;
            MenhirLib.EngineTypes.startp = _startpos__17_;
            MenhirLib.EngineTypes.endp = _endpos__17_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _16;
              MenhirLib.EngineTypes.startp = _startpos__16_;
              MenhirLib.EngineTypes.endp = _endpos__16_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = mac;
                MenhirLib.EngineTypes.startp = _startpos_mac_;
                MenhirLib.EngineTypes.endp = _endpos_mac_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _14;
                  MenhirLib.EngineTypes.startp = _startpos__14_;
                  MenhirLib.EngineTypes.endp = _endpos__14_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _13;
                    MenhirLib.EngineTypes.startp = _startpos__13_;
                    MenhirLib.EngineTypes.endp = _endpos__13_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _12;
                      MenhirLib.EngineTypes.startp = _startpos__12_;
                      MenhirLib.EngineTypes.endp = _endpos__12_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _11;
                        MenhirLib.EngineTypes.startp = _startpos__11_;
                        MenhirLib.EngineTypes.endp = _endpos__11_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _;
                          MenhirLib.EngineTypes.semv = _10;
                          MenhirLib.EngineTypes.startp = _startpos__10_;
                          MenhirLib.EngineTypes.endp = _endpos__10_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.state = _;
                            MenhirLib.EngineTypes.semv = _9;
                            MenhirLib.EngineTypes.startp = _startpos__9_;
                            MenhirLib.EngineTypes.endp = _endpos__9_;
                            MenhirLib.EngineTypes.next = {
                              MenhirLib.EngineTypes.state = _;
                              MenhirLib.EngineTypes.semv = _8;
                              MenhirLib.EngineTypes.startp = _startpos__8_;
                              MenhirLib.EngineTypes.endp = _endpos__8_;
                              MenhirLib.EngineTypes.next = {
                                MenhirLib.EngineTypes.state = _;
                                MenhirLib.EngineTypes.semv = _7;
                                MenhirLib.EngineTypes.startp = _startpos__7_;
                                MenhirLib.EngineTypes.endp = _endpos__7_;
                                MenhirLib.EngineTypes.next = {
                                  MenhirLib.EngineTypes.state = _;
                                  MenhirLib.EngineTypes.semv = _6;
                                  MenhirLib.EngineTypes.startp = _startpos__6_;
                                  MenhirLib.EngineTypes.endp = _endpos__6_;
                                  MenhirLib.EngineTypes.next = {
                                    MenhirLib.EngineTypes.state = _;
                                    MenhirLib.EngineTypes.semv = _5;
                                    MenhirLib.EngineTypes.startp = _startpos__5_;
                                    MenhirLib.EngineTypes.endp = _endpos__5_;
                                    MenhirLib.EngineTypes.next = {
                                      MenhirLib.EngineTypes.state = _;
                                      MenhirLib.EngineTypes.semv = _4;
                                      MenhirLib.EngineTypes.startp = _startpos__4_;
                                      MenhirLib.EngineTypes.endp = _endpos__4_;
                                      MenhirLib.EngineTypes.next = {
                                        MenhirLib.EngineTypes.state = _;
                                        MenhirLib.EngineTypes.semv = _3;
                                        MenhirLib.EngineTypes.startp = _startpos__3_;
                                        MenhirLib.EngineTypes.endp = _endpos__3_;
                                        MenhirLib.EngineTypes.next = {
                                          MenhirLib.EngineTypes.state = _;
                                          MenhirLib.EngineTypes.semv = _2;
                                          MenhirLib.EngineTypes.startp = _startpos__2_;
                                          MenhirLib.EngineTypes.endp = _endpos__2_;
                                          MenhirLib.EngineTypes.next = {
                                            MenhirLib.EngineTypes.state = _menhir_s;
                                            MenhirLib.EngineTypes.semv = _1;
                                            MenhirLib.EngineTypes.startp = _startpos__1_;
                                            MenhirLib.EngineTypes.endp = _endpos__1_;
                                            MenhirLib.EngineTypes.next = _menhir_stack;
                                          };
                                        };
                                      };
                                    };
                                  };
                                };
                              };
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _18 : unit = Obj.magic _18 in
        let _17 : unit = Obj.magic _17 in
        let _16 : unit = Obj.magic _16 in
        let mac : (Ast.macro) = Obj.magic mac in
        let _14 : unit = Obj.magic _14 in
        let _13 : unit = Obj.magic _13 in
        let _12 : unit = Obj.magic _12 in
        let _11 : unit = Obj.magic _11 in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__18_ in
        let _v : (Ast.header) = 
# 102 "parser.mly"
      ( LoadMacros (Some mac) )
# 1366 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _16;
          MenhirLib.EngineTypes.startp = _startpos__16_;
          MenhirLib.EngineTypes.endp = _endpos__16_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _15;
            MenhirLib.EngineTypes.startp = _startpos__15_;
            MenhirLib.EngineTypes.endp = _endpos__15_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _14;
              MenhirLib.EngineTypes.startp = _startpos__14_;
              MenhirLib.EngineTypes.endp = _endpos__14_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _13;
                MenhirLib.EngineTypes.startp = _startpos__13_;
                MenhirLib.EngineTypes.endp = _endpos__13_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _12;
                  MenhirLib.EngineTypes.startp = _startpos__12_;
                  MenhirLib.EngineTypes.endp = _endpos__12_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _11;
                    MenhirLib.EngineTypes.startp = _startpos__11_;
                    MenhirLib.EngineTypes.endp = _endpos__11_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _10;
                      MenhirLib.EngineTypes.startp = _startpos__10_;
                      MenhirLib.EngineTypes.endp = _endpos__10_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _9;
                        MenhirLib.EngineTypes.startp = _startpos__9_;
                        MenhirLib.EngineTypes.endp = _endpos__9_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _;
                          MenhirLib.EngineTypes.semv = _8;
                          MenhirLib.EngineTypes.startp = _startpos__8_;
                          MenhirLib.EngineTypes.endp = _endpos__8_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.state = _;
                            MenhirLib.EngineTypes.semv = _7;
                            MenhirLib.EngineTypes.startp = _startpos__7_;
                            MenhirLib.EngineTypes.endp = _endpos__7_;
                            MenhirLib.EngineTypes.next = {
                              MenhirLib.EngineTypes.state = _;
                              MenhirLib.EngineTypes.semv = _6;
                              MenhirLib.EngineTypes.startp = _startpos__6_;
                              MenhirLib.EngineTypes.endp = _endpos__6_;
                              MenhirLib.EngineTypes.next = {
                                MenhirLib.EngineTypes.state = _;
                                MenhirLib.EngineTypes.semv = _5;
                                MenhirLib.EngineTypes.startp = _startpos__5_;
                                MenhirLib.EngineTypes.endp = _endpos__5_;
                                MenhirLib.EngineTypes.next = {
                                  MenhirLib.EngineTypes.state = _;
                                  MenhirLib.EngineTypes.semv = _4;
                                  MenhirLib.EngineTypes.startp = _startpos__4_;
                                  MenhirLib.EngineTypes.endp = _endpos__4_;
                                  MenhirLib.EngineTypes.next = {
                                    MenhirLib.EngineTypes.state = _;
                                    MenhirLib.EngineTypes.semv = _3;
                                    MenhirLib.EngineTypes.startp = _startpos__3_;
                                    MenhirLib.EngineTypes.endp = _endpos__3_;
                                    MenhirLib.EngineTypes.next = {
                                      MenhirLib.EngineTypes.state = _;
                                      MenhirLib.EngineTypes.semv = _2;
                                      MenhirLib.EngineTypes.startp = _startpos__2_;
                                      MenhirLib.EngineTypes.endp = _endpos__2_;
                                      MenhirLib.EngineTypes.next = {
                                        MenhirLib.EngineTypes.state = _menhir_s;
                                        MenhirLib.EngineTypes.semv = _1;
                                        MenhirLib.EngineTypes.startp = _startpos__1_;
                                        MenhirLib.EngineTypes.endp = _endpos__1_;
                                        MenhirLib.EngineTypes.next = _menhir_stack;
                                      };
                                    };
                                  };
                                };
                              };
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _16 : unit = Obj.magic _16 in
        let _15 : unit = Obj.magic _15 in
        let _14 : unit = Obj.magic _14 in
        let _13 : unit = Obj.magic _13 in
        let _12 : unit = Obj.magic _12 in
        let _11 : unit = Obj.magic _11 in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__16_ in
        let _v : (Ast.header) = 
# 110 "parser.mly"
      ( LoadMacros (None) )
# 1496 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = v;
            MenhirLib.EngineTypes.startp = _startpos_v_;
            MenhirLib.EngineTypes.endp = _endpos_v_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let v : (Ast.variable) = Obj.magic v in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.intext_call) = 
# 431 "parser.mly"
      ( IC_VarV v )
# 1535 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = expr;
            MenhirLib.EngineTypes.startp = _startpos_expr_;
            MenhirLib.EngineTypes.endp = _endpos_expr_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let expr : (Ast.math_expr) = Obj.magic expr in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.intext_call) = 
# 435 "parser.mly"
      ( IC_Math expr )
# 1574 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = id;
          MenhirLib.EngineTypes.startp = _startpos_id_;
          MenhirLib.EngineTypes.endp = _endpos_id_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let id : (
# 75 "parser.mly"
       (string)
# 1601 "parser.ml"
        ) = Obj.magic id in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_id_ in
        let _v : (Ast.key) = 
# 234 "parser.mly"
      ( Ident id )
# 1610 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (
# 75 "parser.mly"
       (string)
# 1631 "parser.ml"
        ) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Ast.key) = 
# 238 "parser.mly"
      ( Str s )
# 1639 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = rest;
          MenhirLib.EngineTypes.startp = _startpos_rest_;
          MenhirLib.EngineTypes.endp = _endpos_rest_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = name;
                MenhirLib.EngineTypes.startp = _startpos_name_;
                MenhirLib.EngineTypes.endp = _endpos_name_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let rest : (Ast.macro) = Obj.magic rest in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 74 "parser.mly"
       (string)
# 1687 "parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_rest_ in
        let _v : (Ast.macro) = 
# 118 "parser.mly"
      ( Macro_Cons (name, rest) )
# 1696 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = name;
            MenhirLib.EngineTypes.startp = _startpos_name_;
            MenhirLib.EngineTypes.endp = _endpos_name_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let name : (
# 74 "parser.mly"
       (string)
# 1730 "parser.ml"
        ) = Obj.magic name in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.macro) = 
# 122 "parser.mly"
      ( Macro_Atom (name) )
# 1739 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _13;
          MenhirLib.EngineTypes.startp = _startpos__13_;
          MenhirLib.EngineTypes.endp = _endpos__13_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _12;
            MenhirLib.EngineTypes.startp = _startpos__12_;
            MenhirLib.EngineTypes.endp = _endpos__12_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _11;
              MenhirLib.EngineTypes.startp = _startpos__11_;
              MenhirLib.EngineTypes.endp = _endpos__11_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _10;
                MenhirLib.EngineTypes.startp = _startpos__10_;
                MenhirLib.EngineTypes.endp = _endpos__10_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _9;
                  MenhirLib.EngineTypes.startp = _startpos__9_;
                  MenhirLib.EngineTypes.endp = _endpos__9_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = prob;
                    MenhirLib.EngineTypes.startp = _startpos_prob_;
                    MenhirLib.EngineTypes.endp = _endpos_prob_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = ctx;
                      MenhirLib.EngineTypes.startp = _startpos_ctx_;
                      MenhirLib.EngineTypes.endp = _endpos_ctx_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = hdr;
                        MenhirLib.EngineTypes.startp = _startpos_hdr_;
                        MenhirLib.EngineTypes.endp = _endpos_hdr_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _;
                          MenhirLib.EngineTypes.semv = _5;
                          MenhirLib.EngineTypes.startp = _startpos__5_;
                          MenhirLib.EngineTypes.endp = _endpos__5_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.state = _;
                            MenhirLib.EngineTypes.semv = _4;
                            MenhirLib.EngineTypes.startp = _startpos__4_;
                            MenhirLib.EngineTypes.endp = _endpos__4_;
                            MenhirLib.EngineTypes.next = {
                              MenhirLib.EngineTypes.state = _;
                              MenhirLib.EngineTypes.semv = _3;
                              MenhirLib.EngineTypes.startp = _startpos__3_;
                              MenhirLib.EngineTypes.endp = _endpos__3_;
                              MenhirLib.EngineTypes.next = {
                                MenhirLib.EngineTypes.state = _;
                                MenhirLib.EngineTypes.semv = _2;
                                MenhirLib.EngineTypes.startp = _startpos__2_;
                                MenhirLib.EngineTypes.endp = _endpos__2_;
                                MenhirLib.EngineTypes.next = {
                                  MenhirLib.EngineTypes.state = _menhir_s;
                                  MenhirLib.EngineTypes.semv = _1;
                                  MenhirLib.EngineTypes.startp = _startpos__1_;
                                  MenhirLib.EngineTypes.endp = _endpos__1_;
                                  MenhirLib.EngineTypes.next = _menhir_stack;
                                };
                              };
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _13 : unit = Obj.magic _13 in
        let _12 : unit = Obj.magic _12 in
        let _11 : unit = Obj.magic _11 in
        let _10 : unit = Obj.magic _10 in
        let _9 : unit = Obj.magic _9 in
        let prob : (Ast.problem_section) = Obj.magic prob in
        let ctx : (Ast.context_setup) = Obj.magic ctx in
        let hdr : (Ast.header) = Obj.magic hdr in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__13_ in
        let _v : (Ast.document) = 
# 89 "parser.mly"
      ( Doc_Minimal   (hdr, ctx, prob) )
# 1848 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = t;
          MenhirLib.EngineTypes.startp = _startpos_t_;
          MenhirLib.EngineTypes.endp = _endpos_t_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = op;
            MenhirLib.EngineTypes.startp = _startpos_op_;
            MenhirLib.EngineTypes.endp = _endpos_op_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = left;
              MenhirLib.EngineTypes.startp = _startpos_left_;
              MenhirLib.EngineTypes.endp = _endpos_left_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let t : (Ast.term) = Obj.magic t in
        let op : unit = Obj.magic op in
        let left : (Ast.math_expr) = Obj.magic left in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_left_ in
        let _endpos = _endpos_t_ in
        let _v : (Ast.math_expr) = 
# 440 "parser.mly"
      ( ME_Add (left, t) )
# 1887 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = t;
          MenhirLib.EngineTypes.startp = _startpos_t_;
          MenhirLib.EngineTypes.endp = _endpos_t_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = op;
            MenhirLib.EngineTypes.startp = _startpos_op_;
            MenhirLib.EngineTypes.endp = _endpos_op_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = left;
              MenhirLib.EngineTypes.startp = _startpos_left_;
              MenhirLib.EngineTypes.endp = _endpos_left_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let t : (Ast.term) = Obj.magic t in
        let op : unit = Obj.magic op in
        let left : (Ast.math_expr) = Obj.magic left in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_left_ in
        let _endpos = _endpos_t_ in
        let _v : (Ast.math_expr) = 
# 444 "parser.mly"
      ( ME_Sub (left, t) )
# 1926 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = t;
          MenhirLib.EngineTypes.startp = _startpos_t_;
          MenhirLib.EngineTypes.endp = _endpos_t_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let t : (Ast.term) = Obj.magic t in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_t_ in
        let _endpos = _endpos_t_ in
        let _v : (Ast.math_expr) = 
# 448 "parser.mly"
      ( ME_Term t )
# 1951 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _8;
          MenhirLib.EngineTypes.startp = _startpos__8_;
          MenhirLib.EngineTypes.endp = _endpos__8_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = i3;
            MenhirLib.EngineTypes.startp = _startpos_i3_;
            MenhirLib.EngineTypes.endp = _endpos_i3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _6;
              MenhirLib.EngineTypes.startp = _startpos__6_;
              MenhirLib.EngineTypes.endp = _endpos__6_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = i2;
                MenhirLib.EngineTypes.startp = _startpos_i2_;
                MenhirLib.EngineTypes.endp = _endpos_i2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _4;
                  MenhirLib.EngineTypes.startp = _startpos__4_;
                  MenhirLib.EngineTypes.endp = _endpos__4_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = i1;
                    MenhirLib.EngineTypes.startp = _startpos_i1_;
                    MenhirLib.EngineTypes.endp = _endpos_i1_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _2;
                      MenhirLib.EngineTypes.startp = _startpos__2_;
                      MenhirLib.EngineTypes.endp = _endpos__2_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _menhir_s;
                        MenhirLib.EngineTypes.semv = _1;
                        MenhirLib.EngineTypes.startp = _startpos__1_;
                        MenhirLib.EngineTypes.endp = _endpos__1_;
                        MenhirLib.EngineTypes.next = _menhir_stack;
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _8 : unit = Obj.magic _8 in
        let i3 : (
# 73 "parser.mly"
       (int)
# 2015 "parser.ml"
        ) = Obj.magic i3 in
        let _6 : unit = Obj.magic _6 in
        let i2 : (
# 73 "parser.mly"
       (int)
# 2021 "parser.ml"
        ) = Obj.magic i2 in
        let _4 : unit = Obj.magic _4 in
        let i1 : (
# 73 "parser.mly"
       (int)
# 2027 "parser.ml"
        ) = Obj.magic i1 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__8_ in
        let _v : (Ast.math_object_method) = 
# 341 "parser.mly"
      ( M_Random (i1, i2, i3) )
# 2037 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _5;
            MenhirLib.EngineTypes.startp = _startpos__5_;
            MenhirLib.EngineTypes.endp = _endpos__5_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = expr;
              MenhirLib.EngineTypes.startp = _startpos_expr_;
              MenhirLib.EngineTypes.endp = _endpos_expr_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _3;
                MenhirLib.EngineTypes.startp = _startpos__3_;
                MenhirLib.EngineTypes.endp = _endpos__3_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let expr : (Ast.math_expr) = Obj.magic expr in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Ast.math_object_method) = 
# 345 "parser.mly"
      ( M_Formula expr )
# 2097 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = n;
            MenhirLib.EngineTypes.startp = _startpos_n_;
            MenhirLib.EngineTypes.endp = _endpos_n_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let n : (
# 72 "parser.mly"
       (float)
# 2137 "parser.ml"
        ) = Obj.magic n in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.math_object_method) = 
# 349 "parser.mly"
      ( M_Real n )
# 2147 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.math_object_method) = 
# 353 "parser.mly"
      ( M_D None )
# 2186 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _5;
            MenhirLib.EngineTypes.startp = _startpos__5_;
            MenhirLib.EngineTypes.endp = _endpos__5_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = unknown;
              MenhirLib.EngineTypes.startp = _startpos_unknown_;
              MenhirLib.EngineTypes.endp = _endpos_unknown_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _3;
                MenhirLib.EngineTypes.startp = _startpos__3_;
                MenhirLib.EngineTypes.endp = _endpos__3_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _2;
                  MenhirLib.EngineTypes.startp = _startpos__2_;
                  MenhirLib.EngineTypes.endp = _endpos__2_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let _5 : unit = Obj.magic _5 in
        let unknown : (
# 75 "parser.mly"
       (string)
# 2239 "parser.ml"
        ) = Obj.magic unknown in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v : (Ast.math_object_method) = 
# 357 "parser.mly"
      ( M_D (Some unknown) )
# 2250 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = prop;
            MenhirLib.EngineTypes.startp = _startpos_prop_;
            MenhirLib.EngineTypes.endp = _endpos_prop_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let prop : (Ast.property) = Obj.magic prop in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.math_object_method) = 
# 361 "parser.mly"
      ( M_Eval prop )
# 2296 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = prop;
            MenhirLib.EngineTypes.startp = _startpos_prop_;
            MenhirLib.EngineTypes.endp = _endpos_prop_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let prop : (Ast.property) = Obj.magic prop in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.math_object_method) = 
# 365 "parser.mly"
      ( M_With prop )
# 2342 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = id;
          MenhirLib.EngineTypes.startp = _startpos_id_;
          MenhirLib.EngineTypes.endp = _endpos_id_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let id : (
# 75 "parser.mly"
       (string)
# 2363 "parser.ml"
        ) = Obj.magic id in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_id_ in
        let _endpos = _endpos_id_ in
        let _v : (Ast.module_) = 
# 157 "parser.mly"
      ( match id with
        | "variables" -> Variables
        | "constants" -> Constants
        | "strings"   -> Strings
        | "operators" -> Operators
        | _ -> failwith ("Unknown module: "^id)
      )
# 2377 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.operator) = 
# 281 "parser.mly"
      ( Add_Op )
# 2402 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.operator) = 
# 285 "parser.mly"
      ( Sub_Op )
# 2427 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.operator) = 
# 289 "parser.mly"
      ( Mul_Op )
# 2452 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Ast.operator) = 
# 293 "parser.mly"
      ( Div_Op )
# 2477 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = tl;
          MenhirLib.EngineTypes.startp = _startpos_tl_;
          MenhirLib.EngineTypes.endp = _endpos_tl_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = hd;
                MenhirLib.EngineTypes.startp = _startpos_hd_;
                MenhirLib.EngineTypes.endp = _endpos_hd_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let tl : (Ast.operator_list) = Obj.magic tl in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let hd : (Ast.operator) = Obj.magic hd in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_tl_ in
        let _v : (Ast.operator_list) = 
# 264 "parser.mly"
      ( hd :: tl )
# 2530 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = tl;
          MenhirLib.EngineTypes.startp = _startpos_tl_;
          MenhirLib.EngineTypes.endp = _endpos_tl_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = hd;
                MenhirLib.EngineTypes.startp = _startpos_hd_;
                MenhirLib.EngineTypes.endp = _endpos_hd_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let tl : (Ast.operator_list) = Obj.magic tl in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let hd : (Ast.operator) = Obj.magic hd in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_tl_ in
        let _v : (Ast.operator_list) = 
# 268 "parser.mly"
      ( hd :: tl )
# 2583 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = single;
            MenhirLib.EngineTypes.startp = _startpos_single_;
            MenhirLib.EngineTypes.endp = _endpos_single_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let single : (Ast.operator) = Obj.magic single in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.operator_list) = 
# 272 "parser.mly"
       ( [single] )
# 2622 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = single;
            MenhirLib.EngineTypes.startp = _startpos_single_;
            MenhirLib.EngineTypes.endp = _endpos_single_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let single : (Ast.operator) = Obj.magic single in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.operator_list) = 
# 276 "parser.mly"
      ( [single] )
# 2661 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = qlist;
              MenhirLib.EngineTypes.startp = _startpos_qlist_;
              MenhirLib.EngineTypes.endp = _endpos_qlist_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let qlist : (Ast.question_list) = Obj.magic qlist in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Ast.problem_section) = 
# 373 "parser.mly"
      ( Problem qlist )
# 2714 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = tl;
          MenhirLib.EngineTypes.startp = _startpos_tl_;
          MenhirLib.EngineTypes.endp = _endpos_tl_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = hd;
              MenhirLib.EngineTypes.startp = _startpos_hd_;
              MenhirLib.EngineTypes.endp = _endpos_hd_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let tl : (Ast.properties) = Obj.magic tl in
        let _2 : unit = Obj.magic _2 in
        let hd : (Ast.property) = Obj.magic hd in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_hd_ in
        let _endpos = _endpos_tl_ in
        let _v : (Ast.properties) = 
# 222 "parser.mly"
      ( hd :: tl )
# 2753 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = single;
          MenhirLib.EngineTypes.startp = _startpos_single_;
          MenhirLib.EngineTypes.endp = _endpos_single_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let single : (Ast.property) = Obj.magic single in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_single_ in
        let _endpos = _endpos_single_ in
        let _v : (Ast.properties) = 
# 226 "parser.mly"
      ( [single] )
# 2778 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = value;
          MenhirLib.EngineTypes.startp = _startpos_value_;
          MenhirLib.EngineTypes.endp = _endpos_value_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = key;
              MenhirLib.EngineTypes.startp = _startpos_key_;
              MenhirLib.EngineTypes.endp = _endpos_key_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let value : (Ast.value) = Obj.magic value in
        let _2 : unit = Obj.magic _2 in
        let key : (Ast.key) = Obj.magic key in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_key_ in
        let _endpos = _endpos_value_ in
        let _v : (Ast.property) = 
# 217 "parser.mly"
      ( Property (key, value) )
# 2817 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ans;
            MenhirLib.EngineTypes.startp = _startpos_ans_;
            MenhirLib.EngineTypes.endp = _endpos_ans_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = qtxt;
                  MenhirLib.EngineTypes.startp = _startpos_qtxt_;
                  MenhirLib.EngineTypes.endp = _endpos_qtxt_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let ans : (Ast.answer_item) = Obj.magic ans in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let qtxt : (Ast.question_text) = Obj.magic qtxt in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_qtxt_ in
        let _endpos = _endpos__5_ in
        let _v : (Ast.question_item) = 
# 385 "parser.mly"
      ( Q_Item (qtxt, ans, None) )
# 2870 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _11;
          MenhirLib.EngineTypes.startp = _startpos__11_;
          MenhirLib.EngineTypes.endp = _endpos__11_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = w;
            MenhirLib.EngineTypes.startp = _startpos_w_;
            MenhirLib.EngineTypes.endp = _endpos_w_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _9;
              MenhirLib.EngineTypes.startp = _startpos__9_;
              MenhirLib.EngineTypes.endp = _endpos__9_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _8;
                MenhirLib.EngineTypes.startp = _startpos__8_;
                MenhirLib.EngineTypes.endp = _endpos__8_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _7;
                  MenhirLib.EngineTypes.startp = _startpos__7_;
                  MenhirLib.EngineTypes.endp = _endpos__7_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = ans;
                    MenhirLib.EngineTypes.startp = _startpos_ans_;
                    MenhirLib.EngineTypes.endp = _endpos_ans_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _5;
                      MenhirLib.EngineTypes.startp = _startpos__5_;
                      MenhirLib.EngineTypes.endp = _endpos__5_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = _4;
                        MenhirLib.EngineTypes.startp = _startpos__4_;
                        MenhirLib.EngineTypes.endp = _endpos__4_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _;
                          MenhirLib.EngineTypes.semv = _3;
                          MenhirLib.EngineTypes.startp = _startpos__3_;
                          MenhirLib.EngineTypes.endp = _endpos__3_;
                          MenhirLib.EngineTypes.next = {
                            MenhirLib.EngineTypes.state = _;
                            MenhirLib.EngineTypes.semv = _2;
                            MenhirLib.EngineTypes.startp = _startpos__2_;
                            MenhirLib.EngineTypes.endp = _endpos__2_;
                            MenhirLib.EngineTypes.next = {
                              MenhirLib.EngineTypes.state = _menhir_s;
                              MenhirLib.EngineTypes.semv = qtxt;
                              MenhirLib.EngineTypes.startp = _startpos_qtxt_;
                              MenhirLib.EngineTypes.endp = _endpos_qtxt_;
                              MenhirLib.EngineTypes.next = _menhir_stack;
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _11 : unit = Obj.magic _11 in
        let w : (
# 73 "parser.mly"
       (int)
# 2952 "parser.ml"
        ) = Obj.magic w in
        let _9 : unit = Obj.magic _9 in
        let _8 : unit = Obj.magic _8 in
        let _7 : unit = Obj.magic _7 in
        let ans : (Ast.answer_item) = Obj.magic ans in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let qtxt : (Ast.question_text) = Obj.magic qtxt in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_qtxt_ in
        let _endpos = _endpos__11_ in
        let _v : (Ast.question_item) = 
# 389 "parser.mly"
      ( Q_Item (qtxt, ans, Some w) )
# 2969 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = rest;
          MenhirLib.EngineTypes.startp = _startpos_rest_;
          MenhirLib.EngineTypes.endp = _endpos_rest_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3;
            MenhirLib.EngineTypes.startp = _startpos__3_;
            MenhirLib.EngineTypes.endp = _endpos__3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = item;
                MenhirLib.EngineTypes.startp = _startpos_item_;
                MenhirLib.EngineTypes.endp = _endpos_item_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let rest : (Ast.question_list) = Obj.magic rest in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let item : (Ast.question_item) = Obj.magic item in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_item_ in
        let _endpos = _endpos_rest_ in
        let _v : (Ast.question_list) = 
# 378 "parser.mly"
      ( item :: rest )
# 3015 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = item;
            MenhirLib.EngineTypes.startp = _startpos_item_;
            MenhirLib.EngineTypes.endp = _endpos_item_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let item : (Ast.question_item) = Obj.magic item in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_item_ in
        let _endpos = _endpos__2_ in
        let _v : (Ast.question_list) = 
# 381 "parser.mly"
      ( [item] )
# 3047 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _7;
          MenhirLib.EngineTypes.startp = _startpos__7_;
          MenhirLib.EngineTypes.endp = _endpos__7_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = call;
            MenhirLib.EngineTypes.startp = _startpos_call_;
            MenhirLib.EngineTypes.endp = _endpos_call_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _5;
              MenhirLib.EngineTypes.startp = _startpos__5_;
              MenhirLib.EngineTypes.endp = _endpos__5_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _4;
                MenhirLib.EngineTypes.startp = _startpos__4_;
                MenhirLib.EngineTypes.endp = _endpos__4_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _3;
                  MenhirLib.EngineTypes.startp = _startpos__3_;
                  MenhirLib.EngineTypes.endp = _endpos__3_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _2;
                    MenhirLib.EngineTypes.startp = _startpos__2_;
                    MenhirLib.EngineTypes.endp = _endpos__2_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _menhir_s;
                      MenhirLib.EngineTypes.semv = _1;
                      MenhirLib.EngineTypes.startp = _startpos__1_;
                      MenhirLib.EngineTypes.endp = _endpos__1_;
                      MenhirLib.EngineTypes.next = _menhir_stack;
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _7 : unit = Obj.magic _7 in
        let call : (Ast.intext_call) = Obj.magic call in
        let _5 : unit = Obj.magic _5 in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__7_ in
        let _v : (Ast.question_text) = 
# 394 "parser.mly"
      ( Q_Value call )
# 3114 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3;
            MenhirLib.EngineTypes.startp = _startpos__3_;
            MenhirLib.EngineTypes.endp = _endpos__3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = call;
                MenhirLib.EngineTypes.startp = _startpos_call_;
                MenhirLib.EngineTypes.endp = _endpos_call_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let _3 : unit = Obj.magic _3 in
        let _2 : unit = Obj.magic _2 in
        let call : (Ast.intext_call) = Obj.magic call in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_call_ in
        let _endpos = _endpos__4_ in
        let _v : (Ast.question_text) = 
# 398 "parser.mly"
      ( Q_IsEqual call )
# 3160 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = op;
            MenhirLib.EngineTypes.startp = _startpos_op_;
            MenhirLib.EngineTypes.endp = _endpos_op_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = left;
              MenhirLib.EngineTypes.startp = _startpos_left_;
              MenhirLib.EngineTypes.endp = _endpos_left_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let f : (Ast.factor) = Obj.magic f in
        let op : unit = Obj.magic op in
        let left : (Ast.term) = Obj.magic left in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_left_ in
        let _endpos = _endpos_f_ in
        let _v : (Ast.term) = 
# 453 "parser.mly"
      ( T_Mul (left, f) )
# 3199 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = op;
            MenhirLib.EngineTypes.startp = _startpos_op_;
            MenhirLib.EngineTypes.endp = _endpos_op_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = left;
              MenhirLib.EngineTypes.startp = _startpos_left_;
              MenhirLib.EngineTypes.endp = _endpos_left_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let f : (Ast.factor) = Obj.magic f in
        let op : unit = Obj.magic op in
        let left : (Ast.term) = Obj.magic left in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_left_ in
        let _endpos = _endpos_f_ in
        let _v : (Ast.term) = 
# 457 "parser.mly"
      ( T_Div (left, f) )
# 3238 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = f;
          MenhirLib.EngineTypes.startp = _startpos_f_;
          MenhirLib.EngineTypes.endp = _endpos_f_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let f : (Ast.factor) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_f_ in
        let _v : (Ast.term) = 
# 461 "parser.mly"
      ( T_Fac f )
# 3263 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let i : (
# 73 "parser.mly"
       (int)
# 3284 "parser.ml"
        ) = Obj.magic i in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_i_ in
        let _endpos = _endpos_i_ in
        let _v : (Ast.value) = 
# 243 "parser.mly"
      ( VInt i )
# 3292 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = n;
          MenhirLib.EngineTypes.startp = _startpos_n_;
          MenhirLib.EngineTypes.endp = _endpos_n_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let n : (
# 72 "parser.mly"
       (float)
# 3313 "parser.ml"
        ) = Obj.magic n in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_n_ in
        let _endpos = _endpos_n_ in
        let _v : (Ast.value) = 
# 247 "parser.mly"
      ( VNum n )
# 3321 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = s;
            MenhirLib.EngineTypes.startp = _startpos_s_;
            MenhirLib.EngineTypes.endp = _endpos_s_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let s : (
# 75 "parser.mly"
       (string)
# 3355 "parser.ml"
        ) = Obj.magic s in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.value) = 
# 251 "parser.mly"
      ( VStr s )
# 3364 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = s;
            MenhirLib.EngineTypes.startp = _startpos_s_;
            MenhirLib.EngineTypes.endp = _endpos_s_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let s : (
# 75 "parser.mly"
       (string)
# 3398 "parser.ml"
        ) = Obj.magic s in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Ast.value) = 
# 255 "parser.mly"
      ( VStr s )
# 3407 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = id;
          MenhirLib.EngineTypes.startp = _startpos_id_;
          MenhirLib.EngineTypes.endp = _endpos_id_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let id : (
# 75 "parser.mly"
       (string)
# 3434 "parser.ml"
        ) = Obj.magic id in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_id_ in
        let _v : (Ast.value) = 
# 259 "parser.mly"
      ( VIdent id )
# 3443 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = v;
          MenhirLib.EngineTypes.startp = _startpos_v_;
          MenhirLib.EngineTypes.endp = _endpos_v_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let v : (Ast.value) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_v_ in
        let _v : (Ast.variable) = 
# 321 "parser.mly"
      ( Var_Value v )
# 3468 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = meth;
          MenhirLib.EngineTypes.startp = _startpos_meth_;
          MenhirLib.EngineTypes.endp = _endpos_meth_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let meth : (Ast.math_object_method) = Obj.magic meth in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_meth_ in
        let _endpos = _endpos_meth_ in
        let _v : (Ast.variable) = 
# 325 "parser.mly"
      ( Var_Method meth )
# 3493 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = meth;
          MenhirLib.EngineTypes.startp = _startpos_meth_;
          MenhirLib.EngineTypes.endp = _endpos_meth_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3;
            MenhirLib.EngineTypes.startp = _startpos__3_;
            MenhirLib.EngineTypes.endp = _endpos__3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = id;
              MenhirLib.EngineTypes.startp = _startpos_id_;
              MenhirLib.EngineTypes.endp = _endpos_id_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let meth : (Ast.math_object_method) = Obj.magic meth in
        let _3 : unit = Obj.magic _3 in
        let id : (
# 75 "parser.mly"
       (string)
# 3534 "parser.ml"
        ) = Obj.magic id in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_meth_ in
        let _v : (Ast.variable) = 
# 329 "parser.mly"
      ( Var_Field (id, meth) )
# 3543 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = rhs;
          MenhirLib.EngineTypes.startp = _startpos_rhs_;
          MenhirLib.EngineTypes.endp = _endpos_rhs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = lhs;
              MenhirLib.EngineTypes.startp = _startpos_lhs_;
              MenhirLib.EngineTypes.endp = _endpos_lhs_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let rhs : (Ast.math_object_method) = Obj.magic rhs in
        let _2 : unit = Obj.magic _2 in
        let lhs : (Ast.math_object_method) = Obj.magic lhs in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_lhs_ in
        let _endpos = _endpos_rhs_ in
        let _v : (Ast.variable) = 
# 333 "parser.mly"
      ( Var_Chain (lhs, rhs) )
# 3582 "parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  and trace =
    None
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
end

let main =
  fun lexer lexbuf : (Ast.document) ->
    Obj.magic (MenhirInterpreter.entry `Legacy 0 lexer lexbuf)

module Incremental = struct
  
  let main =
    fun initial_position : (Ast.document) MenhirInterpreter.checkpoint ->
      Obj.magic (MenhirInterpreter.start 0 initial_position)
  
end

module MenhirSettle = MenhirCST.Settle.Make (MenhirInterpreter.ET)

module DCST = struct
  
  type variable = MenhirSettle.DCST.dcst
  
  let variable_choice =
    MenhirSettle.DCST.choice
  
  (* variable -> value *)
  
  let var_value =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 65 [|
        x0;
      |]
  
  (* variable -> math_object_method *)
  
  let var_meth =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 66 [|
        x0;
      |]
  
  (* variable -> NAMING ID ARROW math_object_method *)
  
  let var_field =
    fun x1 x3 ->
      MenhirSettle.DCST.nonterminal 67 [|
        MenhirSettle.DCST.terminal NAMING;
        MenhirSettle.DCST.terminal (ID x1);
        MenhirSettle.DCST.terminal ARROW;
        x3;
      |]
  
  (* variable -> math_object_method ARROW math_object_method *)
  
  let var_chain =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 68 [|
        x0;
        MenhirSettle.DCST.terminal ARROW;
        x2;
      |]
  
  type value = MenhirSettle.DCST.dcst
  
  let value_choice =
    MenhirSettle.DCST.choice
  
  (* value -> INT *)
  
  let value_int =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 60 [|
        MenhirSettle.DCST.terminal (INT x0);
      |]
  
  (* value -> NUMBER *)
  
  let value_num =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 61 [|
        MenhirSettle.DCST.terminal (NUMBER x0);
      |]
  
  (* value -> DOUBLE_QUOTE ID DOUBLE_QUOTE *)
  
  let value_str_dou =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 62 [|
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal (ID x1);
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
      |]
  
  (* value -> SINGLE_QUOTE ID SINGLE_QUOTE *)
  
  let value_str_sin =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 63 [|
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
        MenhirSettle.DCST.terminal (ID x1);
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
      |]
  
  (* value -> NAMING ID *)
  
  let value_ident =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 64 [|
        MenhirSettle.DCST.terminal NAMING;
        MenhirSettle.DCST.terminal (ID x1);
      |]
  
  type term = MenhirSettle.DCST.dcst
  
  let term_choice =
    MenhirSettle.DCST.choice
  
  (* term -> term MUL_OP factor *)
  
  let tmul =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 57 [|
        x0;
        MenhirSettle.DCST.terminal MUL_OP;
        x2;
      |]
  
  (* term -> term DIV_OP factor *)
  
  let tdiv =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 58 [|
        x0;
        MenhirSettle.DCST.terminal DIV_OP;
        x2;
      |]
  
  (* term -> factor *)
  
  let tfac =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 59 [|
        x0;
      |]
  
  type question_text = MenhirSettle.DCST.dcst
  
  let question_text_choice =
    MenhirSettle.DCST.choice
  
  (* question_text -> WHAT_WORD IS_WORD THE_WORD VALUE_WORD OF_WORD intext_call QUESTION_MARK *)
  
  let qvalue =
    fun x5 ->
      MenhirSettle.DCST.nonterminal 55 [|
        MenhirSettle.DCST.terminal WHAT_WORD;
        MenhirSettle.DCST.terminal IS_WORD;
        MenhirSettle.DCST.terminal THE_WORD;
        MenhirSettle.DCST.terminal VALUE_WORD;
        MenhirSettle.DCST.terminal OF_WORD;
        x5;
        MenhirSettle.DCST.terminal QUESTION_MARK;
      |]
  
  (* question_text -> intext_call IS_WORD EQUAL_WORD TO_WORD *)
  
  let qis =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 56 [|
        x0;
        MenhirSettle.DCST.terminal IS_WORD;
        MenhirSettle.DCST.terminal EQUAL_WORD;
        MenhirSettle.DCST.terminal TO_WORD;
      |]
  
  type question_list = MenhirSettle.DCST.dcst
  
  let question_list_choice =
    MenhirSettle.DCST.choice
  
  (* question_list -> question_item NEWLINE NEWLINE question_list *)
  
  let qlist =
    fun x0 x3 ->
      MenhirSettle.DCST.nonterminal 53 [|
        x0;
        MenhirSettle.DCST.terminal NEWLINE;
        MenhirSettle.DCST.terminal NEWLINE;
        x3;
      |]
  
  (* question_list -> question_item NEWLINE *)
  
  let qlist_single =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 54 [|
        x0;
        MenhirSettle.DCST.terminal NEWLINE;
      |]
  
  type question_item = MenhirSettle.DCST.dcst
  
  let question_item_choice =
    MenhirSettle.DCST.choice
  
  (* question_item -> question_text BLANK LBRACE answer_item RBRACE *)
  
  let qitem1 =
    fun x0 x3 ->
      MenhirSettle.DCST.nonterminal 51 [|
        x0;
        MenhirSettle.DCST.terminal BLANK;
        MenhirSettle.DCST.terminal LBRACE;
        x3;
        MenhirSettle.DCST.terminal RBRACE;
      |]
  
  (* question_item -> question_text BLANK LBRACE ANSWER_WORD FAT_COMMA answer_item COMMA WIDTH_WORD FAT_COMMA INT RBRACE *)
  
  let qitem2 =
    fun x0 x5 x9 ->
      MenhirSettle.DCST.nonterminal 52 [|
        x0;
        MenhirSettle.DCST.terminal BLANK;
        MenhirSettle.DCST.terminal LBRACE;
        MenhirSettle.DCST.terminal ANSWER_WORD;
        MenhirSettle.DCST.terminal FAT_COMMA;
        x5;
        MenhirSettle.DCST.terminal COMMA;
        MenhirSettle.DCST.terminal WIDTH_WORD;
        MenhirSettle.DCST.terminal FAT_COMMA;
        MenhirSettle.DCST.terminal (INT x9);
        MenhirSettle.DCST.terminal RBRACE;
      |]
  
  type property = MenhirSettle.DCST.dcst
  
  let property_choice =
    MenhirSettle.DCST.choice
  
  (* property -> key FAT_COMMA value *)
  
  let property =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 50 [|
        x0;
        MenhirSettle.DCST.terminal FAT_COMMA;
        x2;
      |]
  
  type properties = MenhirSettle.DCST.dcst
  
  let properties_choice =
    MenhirSettle.DCST.choice
  
  (* properties -> property COMMA properties *)
  
  let properties =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 48 [|
        x0;
        MenhirSettle.DCST.terminal COMMA;
        x2;
      |]
  
  (* properties -> property *)
  
  let properties_single =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 49 [|
        x0;
      |]
  
  type problem_section = MenhirSettle.DCST.dcst
  
  let problem_section_choice =
    MenhirSettle.DCST.choice
  
  (* problem_section -> BEGIN_PGML NEWLINE question_list END_PGML NEWLINE *)
  
  let problem_section =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 47 [|
        MenhirSettle.DCST.terminal BEGIN_PGML;
        MenhirSettle.DCST.terminal NEWLINE;
        x2;
        MenhirSettle.DCST.terminal END_PGML;
        MenhirSettle.DCST.terminal NEWLINE;
      |]
  
  type operator_list = MenhirSettle.DCST.dcst
  
  let operator_list_choice =
    MenhirSettle.DCST.choice
  
  (* operator_list -> DOUBLE_QUOTE operator DOUBLE_QUOTE COMMA operator_list *)
  
  let operator_list_dou =
    fun x1 x4 ->
      MenhirSettle.DCST.nonterminal 43 [|
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        x1;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        x4;
      |]
  
  (* operator_list -> SINGLE_QUOTE operator SINGLE_QUOTE COMMA operator_list *)
  
  let operator_list_sin =
    fun x1 x4 ->
      MenhirSettle.DCST.nonterminal 44 [|
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
        x1;
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        x4;
      |]
  
  (* operator_list -> DOUBLE_QUOTE operator DOUBLE_QUOTE *)
  
  let operator_list_single_dou =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 45 [|
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        x1;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
      |]
  
  (* operator_list -> SINGLE_QUOTE operator SINGLE_QUOTE *)
  
  let operator_list_single_sin =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 46 [|
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
        x1;
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
      |]
  
  type operator = MenhirSettle.DCST.dcst
  
  let operator_choice =
    MenhirSettle.DCST.choice
  
  (* operator -> ADD_OP *)
  
  let operator_add =
    fun () ->
      MenhirSettle.DCST.nonterminal 39 [|
        MenhirSettle.DCST.terminal ADD_OP;
      |]
  
  (* operator -> SUB_OP *)
  
  let operator_sub =
    fun () ->
      MenhirSettle.DCST.nonterminal 40 [|
        MenhirSettle.DCST.terminal SUB_OP;
      |]
  
  (* operator -> MUL_OP *)
  
  let operator_mul =
    fun () ->
      MenhirSettle.DCST.nonterminal 41 [|
        MenhirSettle.DCST.terminal MUL_OP;
      |]
  
  (* operator -> DIV_OP *)
  
  let operator_div =
    fun () ->
      MenhirSettle.DCST.nonterminal 42 [|
        MenhirSettle.DCST.terminal DIV_OP;
      |]
  
  type module_ = MenhirSettle.DCST.dcst
  
  let module__choice =
    MenhirSettle.DCST.choice
  
  (* module_ -> ID *)
  
  let module_ =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 38 [|
        MenhirSettle.DCST.terminal (ID x0);
      |]
  
  type math_object_method = MenhirSettle.DCST.dcst
  
  let math_object_method_choice =
    MenhirSettle.DCST.choice
  
  (* math_object_method -> RANDOM_METH LPAREN INT COMMA INT COMMA INT RPAREN *)
  
  let meth_rand =
    fun x2 x4 x6 ->
      MenhirSettle.DCST.nonterminal 31 [|
        MenhirSettle.DCST.terminal RANDOM_METH;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal (INT x2);
        MenhirSettle.DCST.terminal COMMA;
        MenhirSettle.DCST.terminal (INT x4);
        MenhirSettle.DCST.terminal COMMA;
        MenhirSettle.DCST.terminal (INT x6);
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* math_object_method -> FORMULA_METH LPAREN DOUBLE_QUOTE math_expr DOUBLE_QUOTE RPAREN *)
  
  let meth_form =
    fun x3 ->
      MenhirSettle.DCST.nonterminal 32 [|
        MenhirSettle.DCST.terminal FORMULA_METH;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        x3;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* math_object_method -> REAL_METH LPAREN NUMBER RPAREN *)
  
  let meth_real =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 33 [|
        MenhirSettle.DCST.terminal REAL_METH;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal (NUMBER x2);
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* math_object_method -> D_METH LPAREN RPAREN *)
  
  let meth_d_none =
    fun () ->
      MenhirSettle.DCST.nonterminal 34 [|
        MenhirSettle.DCST.terminal D_METH;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* math_object_method -> D_METH LPAREN SINGLE_QUOTE ID SINGLE_QUOTE RPAREN *)
  
  let meth_d =
    fun x3 ->
      MenhirSettle.DCST.nonterminal 35 [|
        MenhirSettle.DCST.terminal D_METH;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
        MenhirSettle.DCST.terminal (ID x3);
        MenhirSettle.DCST.terminal SINGLE_QUOTE;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* math_object_method -> EVAL_METH LPAREN property RPAREN *)
  
  let meth_eval =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 36 [|
        MenhirSettle.DCST.terminal EVAL_METH;
        MenhirSettle.DCST.terminal LPAREN;
        x2;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* math_object_method -> WITH_METH LPAREN property RPAREN *)
  
  let meth_with =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 37 [|
        MenhirSettle.DCST.terminal WITH_METH;
        MenhirSettle.DCST.terminal LPAREN;
        x2;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  type math_expr = MenhirSettle.DCST.dcst
  
  let math_expr_choice =
    MenhirSettle.DCST.choice
  
  (* math_expr -> math_expr ADD_OP term *)
  
  let madd =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 28 [|
        x0;
        MenhirSettle.DCST.terminal ADD_OP;
        x2;
      |]
  
  (* math_expr -> math_expr SUB_OP term *)
  
  let msub =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 29 [|
        x0;
        MenhirSettle.DCST.terminal SUB_OP;
        x2;
      |]
  
  (* math_expr -> term *)
  
  let mterm =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 30 [|
        x0;
      |]
  
  type main = MenhirSettle.DCST.dcst
  
  let main_choice =
    MenhirSettle.DCST.choice
  
  (* main -> DOCUMENT LPAREN RPAREN SEMI NEWLINE header context_setup problem_section ENDDOCUMENT LPAREN RPAREN SEMI EOF *)
  
  let doc_minimal =
    fun x5 x6 x7 ->
      MenhirSettle.DCST.nonterminal 27 [|
        MenhirSettle.DCST.terminal DOCUMENT;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal NEWLINE;
        x5;
        x6;
        x7;
        MenhirSettle.DCST.terminal ENDDOCUMENT;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal EOF;
      |]
  
  type macro = MenhirSettle.DCST.dcst
  
  let macro_choice =
    MenhirSettle.DCST.choice
  
  (* macro -> DOUBLE_QUOTE MACRO DOUBLE_QUOTE COMMA macro *)
  
  let macro_cons =
    fun x1 x4 ->
      MenhirSettle.DCST.nonterminal 25 [|
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal (MACRO x1);
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        x4;
      |]
  
  (* macro -> DOUBLE_QUOTE MACRO DOUBLE_QUOTE *)
  
  let macro_atom =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 26 [|
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal (MACRO x1);
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
      |]
  
  type key = MenhirSettle.DCST.dcst
  
  let key_choice =
    MenhirSettle.DCST.choice
  
  (* key -> NAMING ID *)
  
  let key_ident =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 23 [|
        MenhirSettle.DCST.terminal NAMING;
        MenhirSettle.DCST.terminal (ID x1);
      |]
  
  (* key -> ID *)
  
  let key_str =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 24 [|
        MenhirSettle.DCST.terminal (ID x0);
      |]
  
  type intext_call = MenhirSettle.DCST.dcst
  
  let intext_call_choice =
    MenhirSettle.DCST.choice
  
  (* intext_call -> IT_VAR_OPEN variable IT_VAR_CLOSE *)
  
  let ict_varv =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 21 [|
        MenhirSettle.DCST.terminal IT_VAR_OPEN;
        x1;
        MenhirSettle.DCST.terminal IT_VAR_CLOSE;
      |]
  
  (* intext_call -> IT_MATH_OPEN math_expr IT_MATH_CLOSE *)
  
  let ict_math =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 22 [|
        MenhirSettle.DCST.terminal IT_MATH_OPEN;
        x1;
        MenhirSettle.DCST.terminal IT_MATH_CLOSE;
      |]
  
  type header = MenhirSettle.DCST.dcst
  
  let header_choice =
    MenhirSettle.DCST.choice
  
  (* header -> LOADMACROS LPAREN DOUBLE_QUOTE PGSTANDARD DOUBLE_QUOTE COMMA DOUBLE_QUOTE MATHOBJECTS DOUBLE_QUOTE COMMA DOUBLE_QUOTE PGML DOUBLE_QUOTE COMMA macro RPAREN SEMI NEWLINE *)
  
  let header_with_macro =
    fun x14 ->
      MenhirSettle.DCST.nonterminal 19 [|
        MenhirSettle.DCST.terminal LOADMACROS;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal PGSTANDARD;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal MATHOBJECTS;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal PGML;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        x14;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal NEWLINE;
      |]
  
  (* header -> LOADMACROS LPAREN DOUBLE_QUOTE PGSTANDARD DOUBLE_QUOTE COMMA DOUBLE_QUOTE MATHOBJECTS DOUBLE_QUOTE COMMA DOUBLE_QUOTE PGML DOUBLE_QUOTE RPAREN SEMI NEWLINE *)
  
  let header_simple =
    fun () ->
      MenhirSettle.DCST.nonterminal 20 [|
        MenhirSettle.DCST.terminal LOADMACROS;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal PGSTANDARD;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal MATHOBJECTS;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal COMMA;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal PGML;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal NEWLINE;
      |]
  
  type factor = MenhirSettle.DCST.dcst
  
  let factor_choice =
    MenhirSettle.DCST.choice
  
  (* factor -> LPAREN math_expr RPAREN *)
  
  let fparen =
    fun x1 ->
      MenhirSettle.DCST.nonterminal 16 [|
        MenhirSettle.DCST.terminal LPAREN;
        x1;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* factor -> NUMBER *)
  
  let fnum =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 17 [|
        MenhirSettle.DCST.terminal (NUMBER x0);
      |]
  
  (* factor -> INT *)
  
  let fint =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 18 [|
        MenhirSettle.DCST.terminal (INT x0);
      |]
  
  type entry_list = MenhirSettle.DCST.dcst
  
  let entry_list_choice =
    MenhirSettle.DCST.choice
  
  (* entry_list -> entry COMMA entry_list *)
  
  let entry_list =
    fun x0 x2 ->
      MenhirSettle.DCST.nonterminal 14 [|
        x0;
        MenhirSettle.DCST.terminal COMMA;
        x2;
      |]
  
  (* entry_list -> entry *)
  
  let entry_list_single =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 15 [|
        x0;
      |]
  
  type entry = MenhirSettle.DCST.dcst
  
  let entry_choice =
    MenhirSettle.DCST.choice
  
  (* entry -> key FAT_COMMA LBRACE RBRACE *)
  
  let entry_map_none =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 11 [|
        x0;
        MenhirSettle.DCST.terminal FAT_COMMA;
        MenhirSettle.DCST.terminal LBRACE;
        MenhirSettle.DCST.terminal RBRACE;
      |]
  
  (* entry -> key FAT_COMMA LBRACE properties RBRACE *)
  
  let entry_map =
    fun x0 x3 ->
      MenhirSettle.DCST.nonterminal 12 [|
        x0;
        MenhirSettle.DCST.terminal FAT_COMMA;
        MenhirSettle.DCST.terminal LBRACE;
        x3;
        MenhirSettle.DCST.terminal RBRACE;
      |]
  
  (* entry -> property *)
  
  let entry_prop =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 13 [|
        x0;
      |]
  
  type context_setup = MenhirSettle.DCST.dcst
  
  let context_setup_choice =
    MenhirSettle.DCST.choice
  
  (* context_setup -> CONTEXT LPAREN DOUBLE_QUOTE ID DOUBLE_QUOTE RPAREN SEMI NEWLINE context_config *)
  
  let ctx_with_cfg =
    fun x3 x8 ->
      MenhirSettle.DCST.nonterminal 9 [|
        MenhirSettle.DCST.terminal CONTEXT;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal (ID x3);
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal NEWLINE;
        x8;
      |]
  
  (* context_setup -> CONTEXT LPAREN DOUBLE_QUOTE ID DOUBLE_QUOTE RPAREN SEMI NEWLINE *)
  
  let ctx_only =
    fun x3 ->
      MenhirSettle.DCST.nonterminal 10 [|
        MenhirSettle.DCST.terminal CONTEXT;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal (ID x3);
        MenhirSettle.DCST.terminal DOUBLE_QUOTE;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal NEWLINE;
      |]
  
  type context_method = MenhirSettle.DCST.dcst
  
  let context_method_choice =
    MenhirSettle.DCST.choice
  
  (* context_method -> ADD_METH LPAREN entry_list RPAREN *)
  
  let cm_add =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 4 [|
        MenhirSettle.DCST.terminal ADD_METH;
        MenhirSettle.DCST.terminal LPAREN;
        x2;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* context_method -> SET_METH LPAREN entry_list RPAREN *)
  
  let cm_set =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 5 [|
        MenhirSettle.DCST.terminal SET_METH;
        MenhirSettle.DCST.terminal LPAREN;
        x2;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* context_method -> ARE_METH LPAREN entry_list RPAREN *)
  
  let cm_are =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 6 [|
        MenhirSettle.DCST.terminal ARE_METH;
        MenhirSettle.DCST.terminal LPAREN;
        x2;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* context_method -> UNDEFINE_METH LPAREN operator_list RPAREN *)
  
  let cm_undefine =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 7 [|
        MenhirSettle.DCST.terminal UNDEFINE_METH;
        MenhirSettle.DCST.terminal LPAREN;
        x2;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  (* context_method -> REDEFINE_METH LPAREN operator_list RPAREN *)
  
  let cm_redefine =
    fun x2 ->
      MenhirSettle.DCST.nonterminal 8 [|
        MenhirSettle.DCST.terminal REDEFINE_METH;
        MenhirSettle.DCST.terminal LPAREN;
        x2;
        MenhirSettle.DCST.terminal RPAREN;
      |]
  
  type context_config = MenhirSettle.DCST.dcst
  
  let context_config_choice =
    MenhirSettle.DCST.choice
  
  (* context_config -> CONTEXT LPAREN RPAREN ARROW module_ ARROW context_method SEMI NEWLINE context_config *)
  
  let cfg_cons =
    fun x4 x6 x9 ->
      MenhirSettle.DCST.nonterminal 2 [|
        MenhirSettle.DCST.terminal CONTEXT;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal ARROW;
        x4;
        MenhirSettle.DCST.terminal ARROW;
        x6;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal NEWLINE;
        x9;
      |]
  
  (* context_config -> CONTEXT LPAREN RPAREN ARROW module_ ARROW context_method SEMI NEWLINE *)
  
  let cfg_last =
    fun x4 x6 ->
      MenhirSettle.DCST.nonterminal 3 [|
        MenhirSettle.DCST.terminal CONTEXT;
        MenhirSettle.DCST.terminal LPAREN;
        MenhirSettle.DCST.terminal RPAREN;
        MenhirSettle.DCST.terminal ARROW;
        x4;
        MenhirSettle.DCST.terminal ARROW;
        x6;
        MenhirSettle.DCST.terminal SEMI;
        MenhirSettle.DCST.terminal NEWLINE;
      |]
  
  type answer_item = MenhirSettle.DCST.dcst
  
  let answer_item_choice =
    MenhirSettle.DCST.choice
  
  (* answer_item -> variable *)
  
  let ans_var =
    fun x0 ->
      MenhirSettle.DCST.nonterminal 1 [|
        x0;
      |]
  
end

module CST = struct
  
  type variable = MenhirSettle.CST.cst
  
  type value = MenhirSettle.CST.cst
  
  type term = MenhirSettle.CST.cst
  
  type question_text = MenhirSettle.CST.cst
  
  type question_list = MenhirSettle.CST.cst
  
  type question_item = MenhirSettle.CST.cst
  
  type property = MenhirSettle.CST.cst
  
  type properties = MenhirSettle.CST.cst
  
  type problem_section = MenhirSettle.CST.cst
  
  type operator_list = MenhirSettle.CST.cst
  
  type operator = MenhirSettle.CST.cst
  
  type module_ = MenhirSettle.CST.cst
  
  type math_object_method = MenhirSettle.CST.cst
  
  type math_expr = MenhirSettle.CST.cst
  
  type main = MenhirSettle.CST.cst
  
  type macro = MenhirSettle.CST.cst
  
  type key = MenhirSettle.CST.cst
  
  type intext_call = MenhirSettle.CST.cst
  
  type header = MenhirSettle.CST.cst
  
  type factor = MenhirSettle.CST.cst
  
  type entry_list = MenhirSettle.CST.cst
  
  type entry = MenhirSettle.CST.cst
  
  type context_setup = MenhirSettle.CST.cst
  
  type context_method = MenhirSettle.CST.cst
  
  type context_config = MenhirSettle.CST.cst
  
  type answer_item = MenhirSettle.CST.cst
  
  class virtual ['r] reduce = object (self)
    
    method virtual zero : 'r
    
    method virtual cat : 'r -> 'r -> 'r
    
    method virtual text : string -> 'r
    
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
    
    method virtual visit_NUMBER : (
# 72 "parser.mly"
       (float)
# 4611 "parser.ml"
    ) -> 'r
    
    method virtual visit_NEWLINE : 'r
    
    method virtual visit_NAMING : 'r
    
    method virtual visit_MUL_OP : 'r
    
    method virtual visit_MATHOBJECTS : 'r
    
    method virtual visit_MACRO : (
# 74 "parser.mly"
       (string)
# 4625 "parser.ml"
    ) -> 'r
    
    method virtual visit_LPAREN : 'r
    
    method virtual visit_LOADMACROS : 'r
    
    method virtual visit_LBRACE : 'r
    
    method virtual visit_IT_VAR_OPEN : 'r
    
    method virtual visit_IT_VAR_CLOSE : 'r
    
    method virtual visit_IT_MATH_OPEN : 'r
    
    method virtual visit_IT_MATH_CLOSE : 'r
    
    method virtual visit_IS_WORD : 'r
    
    method virtual visit_INT : (
# 73 "parser.mly"
       (int)
# 4647 "parser.ml"
    ) -> 'r
    
    method virtual visit_ID : (
# 75 "parser.mly"
       (string)
# 4653 "parser.ml"
    ) -> 'r
    
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
    
    method visit_variable = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (65, csts) ->
          self#case_var_value csts.(0)
      | MenhirSettle.CST.NonTerminal (66, csts) ->
          self#case_var_meth csts.(0)
      | MenhirSettle.CST.NonTerminal (67, csts) ->
          self#case_var_field (match csts.(1) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false) csts.(3)
      | MenhirSettle.CST.NonTerminal (68, csts) ->
          self#case_var_chain csts.(0) csts.(2)
      | _ ->
          assert false
    
    method visit_value = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (60, csts) ->
          self#case_value_int (match csts.(0) with
          | MenhirSettle.CST.Terminal (INT v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (61, csts) ->
          self#case_value_num (match csts.(0) with
          | MenhirSettle.CST.Terminal (NUMBER v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (62, csts) ->
          self#case_value_str_dou (match csts.(1) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (63, csts) ->
          self#case_value_str_sin (match csts.(1) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (64, csts) ->
          self#case_value_ident (match csts.(1) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | _ ->
          assert false
    
    method visit_term = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (57, csts) ->
          self#case_tmul csts.(0) csts.(2)
      | MenhirSettle.CST.NonTerminal (58, csts) ->
          self#case_tdiv csts.(0) csts.(2)
      | MenhirSettle.CST.NonTerminal (59, csts) ->
          self#case_tfac csts.(0)
      | _ ->
          assert false
    
    method visit_question_text = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (55, csts) ->
          self#case_qvalue csts.(5)
      | MenhirSettle.CST.NonTerminal (56, csts) ->
          self#case_qis csts.(0)
      | _ ->
          assert false
    
    method visit_question_list = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (53, csts) ->
          self#case_qlist csts.(0) csts.(3)
      | MenhirSettle.CST.NonTerminal (54, csts) ->
          self#case_qlist_single csts.(0)
      | _ ->
          assert false
    
    method visit_question_item = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (51, csts) ->
          self#case_qitem1 csts.(0) csts.(3)
      | MenhirSettle.CST.NonTerminal (52, csts) ->
          self#case_qitem2 csts.(0) csts.(5) (match csts.(9) with
          | MenhirSettle.CST.Terminal (INT v) ->
              v
          | _ ->
              assert false)
      | _ ->
          assert false
    
    method visit_property = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (50, csts) ->
          self#case_property csts.(0) csts.(2)
      | _ ->
          assert false
    
    method visit_properties = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (48, csts) ->
          self#case_properties csts.(0) csts.(2)
      | MenhirSettle.CST.NonTerminal (49, csts) ->
          self#case_properties_single csts.(0)
      | _ ->
          assert false
    
    method visit_problem_section = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (47, csts) ->
          self#case_problem_section csts.(2)
      | _ ->
          assert false
    
    method visit_operator_list = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (43, csts) ->
          self#case_operator_list_dou csts.(1) csts.(4)
      | MenhirSettle.CST.NonTerminal (44, csts) ->
          self#case_operator_list_sin csts.(1) csts.(4)
      | MenhirSettle.CST.NonTerminal (45, csts) ->
          self#case_operator_list_single_dou csts.(1)
      | MenhirSettle.CST.NonTerminal (46, csts) ->
          self#case_operator_list_single_sin csts.(1)
      | _ ->
          assert false
    
    method visit_operator = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (39, csts) ->
          self#case_operator_add ()
      | MenhirSettle.CST.NonTerminal (40, csts) ->
          self#case_operator_sub ()
      | MenhirSettle.CST.NonTerminal (41, csts) ->
          self#case_operator_mul ()
      | MenhirSettle.CST.NonTerminal (42, csts) ->
          self#case_operator_div ()
      | _ ->
          assert false
    
    method visit_module_ = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (38, csts) ->
          self#case_module_ (match csts.(0) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | _ ->
          assert false
    
    method visit_math_object_method = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (31, csts) ->
          self#case_meth_rand (match csts.(2) with
          | MenhirSettle.CST.Terminal (INT v) ->
              v
          | _ ->
              assert false) (match csts.(4) with
          | MenhirSettle.CST.Terminal (INT v) ->
              v
          | _ ->
              assert false) (match csts.(6) with
          | MenhirSettle.CST.Terminal (INT v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (32, csts) ->
          self#case_meth_form csts.(3)
      | MenhirSettle.CST.NonTerminal (33, csts) ->
          self#case_meth_real (match csts.(2) with
          | MenhirSettle.CST.Terminal (NUMBER v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (34, csts) ->
          self#case_meth_d_none ()
      | MenhirSettle.CST.NonTerminal (35, csts) ->
          self#case_meth_d (match csts.(3) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (36, csts) ->
          self#case_meth_eval csts.(2)
      | MenhirSettle.CST.NonTerminal (37, csts) ->
          self#case_meth_with csts.(2)
      | _ ->
          assert false
    
    method visit_math_expr = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (28, csts) ->
          self#case_madd csts.(0) csts.(2)
      | MenhirSettle.CST.NonTerminal (29, csts) ->
          self#case_msub csts.(0) csts.(2)
      | MenhirSettle.CST.NonTerminal (30, csts) ->
          self#case_mterm csts.(0)
      | _ ->
          assert false
    
    method visit_main = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (27, csts) ->
          self#case_doc_minimal csts.(5) csts.(6) csts.(7)
      | _ ->
          assert false
    
    method visit_macro = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (25, csts) ->
          self#case_macro_cons (match csts.(1) with
          | MenhirSettle.CST.Terminal (MACRO v) ->
              v
          | _ ->
              assert false) csts.(4)
      | MenhirSettle.CST.NonTerminal (26, csts) ->
          self#case_macro_atom (match csts.(1) with
          | MenhirSettle.CST.Terminal (MACRO v) ->
              v
          | _ ->
              assert false)
      | _ ->
          assert false
    
    method visit_key = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (23, csts) ->
          self#case_key_ident (match csts.(1) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (24, csts) ->
          self#case_key_str (match csts.(0) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | _ ->
          assert false
    
    method visit_intext_call = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (21, csts) ->
          self#case_ict_varv csts.(1)
      | MenhirSettle.CST.NonTerminal (22, csts) ->
          self#case_ict_math csts.(1)
      | _ ->
          assert false
    
    method visit_header = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (19, csts) ->
          self#case_header_with_macro csts.(14)
      | MenhirSettle.CST.NonTerminal (20, csts) ->
          self#case_header_simple ()
      | _ ->
          assert false
    
    method visit_factor = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (16, csts) ->
          self#case_fparen csts.(1)
      | MenhirSettle.CST.NonTerminal (17, csts) ->
          self#case_fnum (match csts.(0) with
          | MenhirSettle.CST.Terminal (NUMBER v) ->
              v
          | _ ->
              assert false)
      | MenhirSettle.CST.NonTerminal (18, csts) ->
          self#case_fint (match csts.(0) with
          | MenhirSettle.CST.Terminal (INT v) ->
              v
          | _ ->
              assert false)
      | _ ->
          assert false
    
    method visit_entry_list = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (14, csts) ->
          self#case_entry_list csts.(0) csts.(2)
      | MenhirSettle.CST.NonTerminal (15, csts) ->
          self#case_entry_list_single csts.(0)
      | _ ->
          assert false
    
    method visit_entry = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (11, csts) ->
          self#case_entry_map_none csts.(0)
      | MenhirSettle.CST.NonTerminal (12, csts) ->
          self#case_entry_map csts.(0) csts.(3)
      | MenhirSettle.CST.NonTerminal (13, csts) ->
          self#case_entry_prop csts.(0)
      | _ ->
          assert false
    
    method visit_context_setup = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (9, csts) ->
          self#case_ctx_with_cfg (match csts.(3) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false) csts.(8)
      | MenhirSettle.CST.NonTerminal (10, csts) ->
          self#case_ctx_only (match csts.(3) with
          | MenhirSettle.CST.Terminal (ID v) ->
              v
          | _ ->
              assert false)
      | _ ->
          assert false
    
    method visit_context_method = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (4, csts) ->
          self#case_cm_add csts.(2)
      | MenhirSettle.CST.NonTerminal (5, csts) ->
          self#case_cm_set csts.(2)
      | MenhirSettle.CST.NonTerminal (6, csts) ->
          self#case_cm_are csts.(2)
      | MenhirSettle.CST.NonTerminal (7, csts) ->
          self#case_cm_undefine csts.(2)
      | MenhirSettle.CST.NonTerminal (8, csts) ->
          self#case_cm_redefine csts.(2)
      | _ ->
          assert false
    
    method visit_context_config = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (2, csts) ->
          self#case_cfg_cons csts.(4) csts.(6) csts.(9)
      | MenhirSettle.CST.NonTerminal (3, csts) ->
          self#case_cfg_last csts.(4) csts.(6)
      | _ ->
          assert false
    
    method visit_answer_item = fun t : 'r ->
      match t with
      | MenhirSettle.CST.NonTerminal (1, csts) ->
          self#case_ans_var csts.(0)
      | _ ->
          assert false
    
    method case_ans_var = fun x0 : 'r ->
      self#visit_variable x0
    
    method case_cfg_cons = fun x4 x6 x9 : 'r ->
      self#cat self#visit_CONTEXT (self#cat self#visit_LPAREN (self#cat self#visit_RPAREN (self#cat self#visit_ARROW (self#cat (self#visit_module_ x4) (self#cat self#visit_ARROW (self#cat (self#visit_context_method x6) (self#cat self#visit_SEMI (self#cat self#visit_NEWLINE (self#visit_context_config x9)))))))))
    
    method case_cfg_last = fun x4 x6 : 'r ->
      self#cat self#visit_CONTEXT (self#cat self#visit_LPAREN (self#cat self#visit_RPAREN (self#cat self#visit_ARROW (self#cat (self#visit_module_ x4) (self#cat self#visit_ARROW (self#cat (self#visit_context_method x6) (self#cat self#visit_SEMI self#visit_NEWLINE)))))))
    
    method case_cm_add = fun x2 : 'r ->
      self#cat self#visit_ADD_METH (self#cat self#visit_LPAREN (self#cat (self#visit_entry_list x2) self#visit_RPAREN))
    
    method case_cm_set = fun x2 : 'r ->
      self#cat self#visit_SET_METH (self#cat self#visit_LPAREN (self#cat (self#visit_entry_list x2) self#visit_RPAREN))
    
    method case_cm_are = fun x2 : 'r ->
      self#cat self#visit_ARE_METH (self#cat self#visit_LPAREN (self#cat (self#visit_entry_list x2) self#visit_RPAREN))
    
    method case_cm_undefine = fun x2 : 'r ->
      self#cat self#visit_UNDEFINE_METH (self#cat self#visit_LPAREN (self#cat (self#visit_operator_list x2) self#visit_RPAREN))
    
    method case_cm_redefine = fun x2 : 'r ->
      self#cat self#visit_REDEFINE_METH (self#cat self#visit_LPAREN (self#cat (self#visit_operator_list x2) self#visit_RPAREN))
    
    method case_ctx_with_cfg = fun x3 x8 : 'r ->
      self#cat self#visit_CONTEXT (self#cat self#visit_LPAREN (self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_ID x3) (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_RPAREN (self#cat self#visit_SEMI (self#cat self#visit_NEWLINE (self#visit_context_config x8))))))))
    
    method case_ctx_only = fun x3 : 'r ->
      self#cat self#visit_CONTEXT (self#cat self#visit_LPAREN (self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_ID x3) (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_RPAREN (self#cat self#visit_SEMI self#visit_NEWLINE))))))
    
    method case_entry_map_none = fun x0 : 'r ->
      self#cat (self#visit_key x0) (self#cat self#visit_FAT_COMMA (self#cat self#visit_LBRACE self#visit_RBRACE))
    
    method case_entry_map = fun x0 x3 : 'r ->
      self#cat (self#visit_key x0) (self#cat self#visit_FAT_COMMA (self#cat self#visit_LBRACE (self#cat (self#visit_properties x3) self#visit_RBRACE)))
    
    method case_entry_prop = fun x0 : 'r ->
      self#visit_property x0
    
    method case_entry_list = fun x0 x2 : 'r ->
      self#cat (self#visit_entry x0) (self#cat self#visit_COMMA (self#visit_entry_list x2))
    
    method case_entry_list_single = fun x0 : 'r ->
      self#visit_entry x0
    
    method case_fparen = fun x1 : 'r ->
      self#cat self#visit_LPAREN (self#cat (self#visit_math_expr x1) self#visit_RPAREN)
    
    method case_fnum = fun x0 : 'r ->
      self#visit_NUMBER x0
    
    method case_fint = fun x0 : 'r ->
      self#visit_INT x0
    
    method case_header_with_macro = fun x14 : 'r ->
      self#cat self#visit_LOADMACROS (self#cat self#visit_LPAREN (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_PGSTANDARD (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_COMMA (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_MATHOBJECTS (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_COMMA (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_PGML (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_COMMA (self#cat (self#visit_macro x14) (self#cat self#visit_RPAREN (self#cat self#visit_SEMI self#visit_NEWLINE))))))))))))))))
    
    method case_header_simple = fun () : 'r ->
      self#cat self#visit_LOADMACROS (self#cat self#visit_LPAREN (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_PGSTANDARD (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_COMMA (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_MATHOBJECTS (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_COMMA (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_PGML (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_RPAREN (self#cat self#visit_SEMI self#visit_NEWLINE))))))))))))))
    
    method case_ict_varv = fun x1 : 'r ->
      self#cat self#visit_IT_VAR_OPEN (self#cat (self#visit_variable x1) self#visit_IT_VAR_CLOSE)
    
    method case_ict_math = fun x1 : 'r ->
      self#cat self#visit_IT_MATH_OPEN (self#cat (self#visit_math_expr x1) self#visit_IT_MATH_CLOSE)
    
    method case_key_ident = fun x1 : 'r ->
      self#cat self#visit_NAMING (self#visit_ID x1)
    
    method case_key_str = fun x0 : 'r ->
      self#visit_ID x0
    
    method case_macro_cons = fun x1 x4 : 'r ->
      self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_MACRO x1) (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_COMMA (self#visit_macro x4))))
    
    method case_macro_atom = fun x1 : 'r ->
      self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_MACRO x1) self#visit_DOUBLE_QUOTE)
    
    method case_doc_minimal = fun x5 x6 x7 : 'r ->
      self#cat self#visit_DOCUMENT (self#cat self#visit_LPAREN (self#cat self#visit_RPAREN (self#cat self#visit_SEMI (self#cat self#visit_NEWLINE (self#cat (self#visit_header x5) (self#cat (self#visit_context_setup x6) (self#cat (self#visit_problem_section x7) (self#cat self#visit_ENDDOCUMENT (self#cat self#visit_LPAREN (self#cat self#visit_RPAREN (self#cat self#visit_SEMI self#visit_EOF)))))))))))
    
    method case_madd = fun x0 x2 : 'r ->
      self#cat (self#visit_math_expr x0) (self#cat self#visit_ADD_OP (self#visit_term x2))
    
    method case_msub = fun x0 x2 : 'r ->
      self#cat (self#visit_math_expr x0) (self#cat self#visit_SUB_OP (self#visit_term x2))
    
    method case_mterm = fun x0 : 'r ->
      self#visit_term x0
    
    method case_meth_rand = fun x2 x4 x6 : 'r ->
      self#cat self#visit_RANDOM_METH (self#cat self#visit_LPAREN (self#cat (self#visit_INT x2) (self#cat self#visit_COMMA (self#cat (self#visit_INT x4) (self#cat self#visit_COMMA (self#cat (self#visit_INT x6) self#visit_RPAREN))))))
    
    method case_meth_form = fun x3 : 'r ->
      self#cat self#visit_FORMULA_METH (self#cat self#visit_LPAREN (self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_math_expr x3) (self#cat self#visit_DOUBLE_QUOTE self#visit_RPAREN))))
    
    method case_meth_real = fun x2 : 'r ->
      self#cat self#visit_REAL_METH (self#cat self#visit_LPAREN (self#cat (self#visit_NUMBER x2) self#visit_RPAREN))
    
    method case_meth_d_none = fun () : 'r ->
      self#cat self#visit_D_METH (self#cat self#visit_LPAREN self#visit_RPAREN)
    
    method case_meth_d = fun x3 : 'r ->
      self#cat self#visit_D_METH (self#cat self#visit_LPAREN (self#cat self#visit_SINGLE_QUOTE (self#cat (self#visit_ID x3) (self#cat self#visit_SINGLE_QUOTE self#visit_RPAREN))))
    
    method case_meth_eval = fun x2 : 'r ->
      self#cat self#visit_EVAL_METH (self#cat self#visit_LPAREN (self#cat (self#visit_property x2) self#visit_RPAREN))
    
    method case_meth_with = fun x2 : 'r ->
      self#cat self#visit_WITH_METH (self#cat self#visit_LPAREN (self#cat (self#visit_property x2) self#visit_RPAREN))
    
    method case_module_ = fun x0 : 'r ->
      self#visit_ID x0
    
    method case_operator_add = fun () : 'r ->
      self#visit_ADD_OP
    
    method case_operator_sub = fun () : 'r ->
      self#visit_SUB_OP
    
    method case_operator_mul = fun () : 'r ->
      self#visit_MUL_OP
    
    method case_operator_div = fun () : 'r ->
      self#visit_DIV_OP
    
    method case_operator_list_dou = fun x1 x4 : 'r ->
      self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_operator x1) (self#cat self#visit_DOUBLE_QUOTE (self#cat self#visit_COMMA (self#visit_operator_list x4))))
    
    method case_operator_list_sin = fun x1 x4 : 'r ->
      self#cat self#visit_SINGLE_QUOTE (self#cat (self#visit_operator x1) (self#cat self#visit_SINGLE_QUOTE (self#cat self#visit_COMMA (self#visit_operator_list x4))))
    
    method case_operator_list_single_dou = fun x1 : 'r ->
      self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_operator x1) self#visit_DOUBLE_QUOTE)
    
    method case_operator_list_single_sin = fun x1 : 'r ->
      self#cat self#visit_SINGLE_QUOTE (self#cat (self#visit_operator x1) self#visit_SINGLE_QUOTE)
    
    method case_problem_section = fun x2 : 'r ->
      self#cat self#visit_BEGIN_PGML (self#cat self#visit_NEWLINE (self#cat (self#visit_question_list x2) (self#cat self#visit_END_PGML self#visit_NEWLINE)))
    
    method case_properties = fun x0 x2 : 'r ->
      self#cat (self#visit_property x0) (self#cat self#visit_COMMA (self#visit_properties x2))
    
    method case_properties_single = fun x0 : 'r ->
      self#visit_property x0
    
    method case_property = fun x0 x2 : 'r ->
      self#cat (self#visit_key x0) (self#cat self#visit_FAT_COMMA (self#visit_value x2))
    
    method case_qitem1 = fun x0 x3 : 'r ->
      self#cat (self#visit_question_text x0) (self#cat self#visit_BLANK (self#cat self#visit_LBRACE (self#cat (self#visit_answer_item x3) self#visit_RBRACE)))
    
    method case_qitem2 = fun x0 x5 x9 : 'r ->
      self#cat (self#visit_question_text x0) (self#cat self#visit_BLANK (self#cat self#visit_LBRACE (self#cat self#visit_ANSWER_WORD (self#cat self#visit_FAT_COMMA (self#cat (self#visit_answer_item x5) (self#cat self#visit_COMMA (self#cat self#visit_WIDTH_WORD (self#cat self#visit_FAT_COMMA (self#cat (self#visit_INT x9) self#visit_RBRACE)))))))))
    
    method case_qlist = fun x0 x3 : 'r ->
      self#cat (self#visit_question_item x0) (self#cat self#visit_NEWLINE (self#cat self#visit_NEWLINE (self#visit_question_list x3)))
    
    method case_qlist_single = fun x0 : 'r ->
      self#cat (self#visit_question_item x0) self#visit_NEWLINE
    
    method case_qvalue = fun x5 : 'r ->
      self#cat self#visit_WHAT_WORD (self#cat self#visit_IS_WORD (self#cat self#visit_THE_WORD (self#cat self#visit_VALUE_WORD (self#cat self#visit_OF_WORD (self#cat (self#visit_intext_call x5) self#visit_QUESTION_MARK)))))
    
    method case_qis = fun x0 : 'r ->
      self#cat (self#visit_intext_call x0) (self#cat self#visit_IS_WORD (self#cat self#visit_EQUAL_WORD self#visit_TO_WORD))
    
    method case_tmul = fun x0 x2 : 'r ->
      self#cat (self#visit_term x0) (self#cat self#visit_MUL_OP (self#visit_factor x2))
    
    method case_tdiv = fun x0 x2 : 'r ->
      self#cat (self#visit_term x0) (self#cat self#visit_DIV_OP (self#visit_factor x2))
    
    method case_tfac = fun x0 : 'r ->
      self#visit_factor x0
    
    method case_value_int = fun x0 : 'r ->
      self#visit_INT x0
    
    method case_value_num = fun x0 : 'r ->
      self#visit_NUMBER x0
    
    method case_value_str_dou = fun x1 : 'r ->
      self#cat self#visit_DOUBLE_QUOTE (self#cat (self#visit_ID x1) self#visit_DOUBLE_QUOTE)
    
    method case_value_str_sin = fun x1 : 'r ->
      self#cat self#visit_SINGLE_QUOTE (self#cat (self#visit_ID x1) self#visit_SINGLE_QUOTE)
    
    method case_value_ident = fun x1 : 'r ->
      self#cat self#visit_NAMING (self#visit_ID x1)
    
    method case_var_value = fun x0 : 'r ->
      self#visit_value x0
    
    method case_var_meth = fun x0 : 'r ->
      self#visit_math_object_method x0
    
    method case_var_field = fun x1 x3 : 'r ->
      self#cat self#visit_NAMING (self#cat (self#visit_ID x1) (self#cat self#visit_ARROW (self#visit_math_object_method x3)))
    
    method case_var_chain = fun x0 x2 : 'r ->
      self#cat (self#visit_math_object_method x0) (self#cat self#visit_ARROW (self#visit_math_object_method x2))
    
  end
  
end

module Settle = struct
  
  let main =
    fun t ->
      MenhirSettle.settle (t, 0, 57)
  
end
