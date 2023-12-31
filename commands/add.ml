let rec run (files : string list) =
  try
    Utils.Filesystem.got_initialized "add";
    match files with
    | [] -> "No file added."
    | _ ->
        Utils.Stage.add_files_to_stage files;
        "Added " ^ String.concat " " files
  with
  | Utils.Filesystem.File_not_found msg -> msg
  | Utils.Filesystem.Got_initialized msg -> msg
  | _ ->
      (* Handle other exceptions *)
      Unix.sleepf 1.5;
      run files
