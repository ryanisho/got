open Commands

let () =
  let args = List.tl (Array.to_list Sys.argv) in
  let output =
    match args with
    | "init" :: _ -> Commands.Init.run ()
    | "add" :: files -> Commands.Add.run files
    | "commit" :: _ -> Commands.Commit.run [ "a" ]
    | [] -> "Usage: got [init] [add] [commit]"
    | _ -> "Command not supported!"
  in
  print_endline output
