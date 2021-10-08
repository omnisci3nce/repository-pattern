module User = struct
  type t = {
    id: int;
    name : string;
    email : string
  }
  let get_id user = user.id
  let default = { id = 999; name = "Dummy"; email = "default@example.com" }
  let create id name email = { id = id; name = name; email = email }

  let print_user (user: t) = 
    Printf.printf "  id: %d \n" user.id;
    Printf.printf "  name: %s \n" user.name;
    Printf.printf "  email: %s \n" user.email;
end

module Users = Repo.Make(User)

let users = ref [
  User.create 1 "Ted" "ted@example.com";
  User.create 2 "Amy" "amy@example.com";
]

let find_and_print_user id =
  let result = Users.get_one id !users in
  match result with
  | Some user -> User.print_user user
  | None      -> print_endline "Couldnt find user."

let () = 
  find_and_print_user 1;
  find_and_print_user 2;
  find_and_print_user 3