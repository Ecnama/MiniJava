include Map.S with type key = string
(** A map where keys are strings. Consult [Map.S] in Objective Caml's
    documentation. *)

val addm : 'a t -> 'a t -> 'a t
(** [addm m1 m2] adds the bindings in the map [m1] to the map [m2], overriding
    any previous binding if [m1] and [m2] have common keys. *)

exception Duplicate of key
(** [of_association_list l] turns an association list into a map. It raises
    [Duplicate key] if a key appears twice in the list. [to_association_list m]
    turns a map into an association list. *)

val of_association_list : (key * 'a) list -> 'a t

val domain : 'a t -> StringSet.t
(** [domain m] is the domain of the map [m], that is, the set of keys that are
    defined. *)
