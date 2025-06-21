open Ast_printer
open Parser   (* for Parser.Settle *)
open Semantic
open Describe

let () =
  if Array.length Sys.argv = 2 then begin
    let student_id = Sys.argv.(1) in
    
    let seed = Generator.seed_of_id student_id in
    Random.init seed;
    
    let doc   = Generator.gen_document () in
    
    (* Print a nicely‐formatted AST followed by a newline: *)
    print_endline "";
    print_endline "Generated AST: ";
    print_endline "";
    Format.printf "%a@." pp_document doc;
    print_endline "";

    let dcst  = describe_document doc in

    let cst = match Settle.main dcst with
      | Some c -> c
      | None   -> prerr_endline "\n=== settle failed on this DCST tree ===\n";
                  failwith "settle fail"
    in
      print_endline ""; print_endline "Generated PGML code: "; print_endline "";
      PPrint.ToChannel.pretty 1.0 80 stdout (Print_pprint.to_doc cst)
  
  end else begin
    (* Original parse-from-stdin → unparse → print *)
    let lexbuf = Lexing.from_channel stdin in
    let doc    = Parser.main Lexer.read lexbuf in
    
    (* 1. Run semantic validation: *)
    (try
        validate doc;
        print_endline ""; print_endline "";
        prerr_endline "Semantic: OK"
      with
      | Semantic_error msg ->
        print_endline ""; print_endline "";   
        prerr_endline ("Semantic error: " ^ msg);
        exit 1
    );

    (* 2. If we got here, AST is both syntactically and semantically valid *)
    (* Print a nicely‐formatted AST followed by a newline: *)
    print_endline "";
    print_endline "AST: ";
    print_endline "";
    Format.printf "%a@." pp_document doc;
    print_endline "";
    
    let dcst   = describe_document doc in
    let cst = match Settle.main dcst with
      | Some c -> c
      | None   -> failwith "settle fail" 
    in
      print_endline ""; print_endline "After unparsing: "; print_endline "";
      PPrint.ToChannel.pretty 1.0 80 stdout (Print_pprint.to_doc cst)
  end