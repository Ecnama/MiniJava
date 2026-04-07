(** This is the same abstract syntax tree as in [LMJ.mli] but without position informations.
    After typechecking, we don't need to give feedbacks to the user. *)

type identifier = string

type expression = { raw_expression : raw_expression; typ : typ }

and raw_expression =
  | EConst of constant
  | EGetVar of identifier
  | EUnOp of unop * expression
  | EBinOp of binop * expression * expression
  | EFunOp of funop * expression * expression
  | EMethodCall of expression * identifier * expression list
  | EArrayGet of expression * expression
  | EIntArrayAlloc of expression
  | EFloatArrayAlloc of expression
  | EArrayLength of expression
  | EThis
  | EObjectAlloc of identifier

and constant = LMJ.constant =
  | ConstBool of bool
  | ConstInt of int32
  | ConstFloat of float

and funop = LMJ.funop =
  | OpMod

and binop = LMJ.binop =
  | OpAdd
  | OpSub
  | OpMul
  | OpDiv
  | OpRem
  | OpLt
  | OpGt
  | OpBWAnd
  | OpBWOr
  | OpBWXOr
  | OpAnd
  | OpOr
  | OpEq
  | OpNotEq
  | OpLtEq
  | OpGtEq

and unop = LMJ.unop = 
  | UOpNot
  | UOpSub

and instruction =
  | IBlock of instruction list
  | IIf of expression * instruction * instruction
  | IWhile of expression * instruction
  | IDoWhile of instruction * expression
  | IFor of identifier * expression * expression * identifier * expression * instruction
  | IContinue
  | ISyso of expression
  | ISetVar of identifier * typ * expression
  | IArraySet of identifier * expression * expression
  | IBreak

and typ =
  | TypInt
  | TypBool
  | TypIntArray
  | TypFloat
  | TypFloatArray
  | Typ of identifier

and metho = {
    formals: (identifier * typ) list;
    result: typ;
    locals: (identifier * typ) list;
    body: instruction list;
    return: expression
  }

and clas = {
    extends: identifier option;
    attributes: (identifier * typ) list;
    methods: (identifier * metho) list
  }

and program = {
    name: identifier;
    defs: (identifier * clas) list;
    main_args: identifier;
    main: instruction
  }
