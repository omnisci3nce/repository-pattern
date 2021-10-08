module type TYPE = sig
  type t 

  val get_id : t -> int
  val  default : t
end 

module Make = functor(Arg : TYPE) -> struct
  include Arg
  let get = function None -> default | Some x -> (x : t)

  let get_all items = items
  let get_one (id: int) (items: t list) : t option =
    try Some (List.find (fun i -> get_id i = id) items) with
      Not_found -> None

  let create (item: t) (items: t list) = item :: items
end