module Data exposing (..)


type Typeclass
    = Eq
    | Ord
    | Show
    | Read
    | MonadFail
    | Foldable
    | Traversable
    | Semigroup
    | Monoid
    | Functor
    | Applicative
    | Monad
    | Bounded
    | Enum


typeclassString : Typeclass -> String
typeclassString tc =
    case tc of
        Eq ->
            "Eq"

        Ord ->
            "Ord"

        Show ->
            "Show"

        Read ->
            "Read"

        MonadFail ->
            "MonadFail"

        Foldable ->
            "Foldable"

        Traversable ->
            "Traversable"

        Semigroup ->
            "Semigroup"

        Monoid ->
            "Monoid"

        Functor ->
            "Functor"

        Applicative ->
            "Applicative"

        Monad ->
            "Monad"

        Enum ->
            "Enum"

        Bounded ->
            "Bounded"


allTypeclasses : List Typeclass
allTypeclasses =
    [ Bounded, Enum, Eq, Ord, Show, Read, MonadFail, Foldable, Traversable, Semigroup, Monoid, Functor, Applicative, Monad ]


type alias DataType =
    { name : String
    , instances : List Typeclass
    }


dMaybe : DataType
dMaybe =
    DataType "Maybe" [ Eq, Ord, Show, Read, MonadFail, Foldable, Traversable, Semigroup, Monoid, Functor, Applicative, Monad ]


dOrdering : DataType
dOrdering =
    DataType "Ordering" [ Eq, Monoid, Ord, Semigroup, Enum, Show, Read, Bounded ]


dEither : DataType
dEither =
    DataType "Either" [ Applicative, Eq, Functor, Monad, Ord, Semigroup, Show, Read, Foldable, Traversable ]


dList : DataType
dList =
    DataType "List" [ Applicative, Eq, Functor, Monad, Monoid, Ord, Semigroup, Show, MonadFail, Read, Foldable, Traversable ]


dIO : DataType
dIO =
    DataType "IO" [ Applicative, Functor, Monad, Monoid, Semigroup, MonadFail ]


dFn : DataType
dFn =
    DataType "->" [ Applicative, Functor, Monad, Monoid, Semigroup ]


dTuple : DataType
dTuple =
    DataType "Tuple" [ Monoid, Eq, Functor, Monad, Applicative, Ord, Semigroup, Show, Read, Foldable, Traversable, Bounded ]


dUnit : DataType
dUnit =
    DataType "Unit" [ Eq, Monoid, Ord, Semigroup, Enum, Show, Read, Bounded ]


data : List DataType
data =
    [ dMaybe, dOrdering, dEither, dList, dIO, dFn, dTuple, dUnit ]
