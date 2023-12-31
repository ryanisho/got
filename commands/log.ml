let commit_to_log_entry (commit : Utils.Commit.t) =
  "[" ^ commit.timestamp ^ "] " ^ commit.message ^ "\n"

let rec run () =
  try
    Utils.Filesystem.got_initialized "log";
    let commit_history = Utils.Commit.get_commit_history_from_head () in
    let output =
      commit_history |> List.map commit_to_log_entry |> List.fold_left ( ^ ) ""
    in
    String.sub output 0 (String.length output - 1)
  with Utils.Filesystem.Got_initialized msg -> msg
