module Data exposing (..)

---- DATA MODEL ----


type alias Typeclass =
    { name : String
    }


typeclassString : Typeclass -> String
typeclassString tc =
    tc.name


type alias DataType =
    { name : String
    , instances : List Typeclass
    }



---- DATA INPUT (manual, for now) ----


allTypeclasses : List Typeclass
allTypeclasses =
    List.concat [ preludeTypeclasses ]


allDataTypes : List DataType
allDataTypes =
    List.concat [ preludeDataTypes ]



---- GHC PRELUDE ----


preludeTypeclasses : List Typeclass
preludeTypeclasses =
    [ tcBounded, tcEnum, tcEq, tcOrd, tcShow, tcRead, tcMonadFail, tcFoldable, tcTraversable, tcSemigroup, tcMonoid, tcFunctor, tcApplicative, tcMonad ]


tcEq : Typeclass
tcEq =
    Typeclass "Eq"


tcOrd : Typeclass
tcOrd =
    Typeclass "Ord"


tcShow : Typeclass
tcShow =
    Typeclass "Show"


tcRead : Typeclass
tcRead =
    Typeclass "Read"


tcMonadFail : Typeclass
tcMonadFail =
    Typeclass "MonadFail"


tcFoldable : Typeclass
tcFoldable =
    Typeclass "Foldable"


tcTraversable : Typeclass
tcTraversable =
    Typeclass "Traversable"


tcSemigroup : Typeclass
tcSemigroup =
    Typeclass "Semigroup"


tcMonoid : Typeclass
tcMonoid =
    Typeclass "Monoid"


tcFunctor : Typeclass
tcFunctor =
    Typeclass "Functor"


tcApplicative : Typeclass
tcApplicative =
    Typeclass "Applicative"


tcMonad : Typeclass
tcMonad =
    Typeclass "Monad"


tcBounded : Typeclass
tcBounded =
    Typeclass "Bounded"


tcEnum : Typeclass
tcEnum =
    Typeclass "Enum"


preludeDataTypes : List DataType
preludeDataTypes =
    [ dMaybe, dOrdering, dEither, dList, dIO, dFn, dTuple, dUnit ]


dMaybe : DataType
dMaybe =
    DataType "Maybe" [ tcEq, tcOrd, tcShow, tcRead, tcMonadFail, tcFoldable, tcTraversable, tcSemigroup, tcMonoid, tcFunctor, tcApplicative, tcMonad ]


dOrdering : DataType
dOrdering =
    DataType "Ordering" [ tcEq, tcMonoid, tcOrd, tcSemigroup, tcEnum, tcShow, tcRead, tcBounded ]


dEither : DataType
dEither =
    DataType "Either" [ tcApplicative, tcEq, tcFunctor, tcMonad, tcOrd, tcSemigroup, tcShow, tcRead, tcFoldable, tcTraversable ]


dList : DataType
dList =
    DataType "List" [ tcApplicative, tcEq, tcFunctor, tcMonad, tcMonoid, tcOrd, tcSemigroup, tcShow, tcMonadFail, tcRead, tcFoldable, tcTraversable ]


dIO : DataType
dIO =
    DataType "IO" [ tcApplicative, tcFunctor, tcMonad, tcMonoid, tcSemigroup, tcMonadFail ]


dFn : DataType
dFn =
    DataType "->" [ tcApplicative, tcFunctor, tcMonad, tcMonoid, tcSemigroup ]


dTuple : DataType
dTuple =
    DataType "Tuple" [ tcMonoid, tcEq, tcFunctor, tcMonad, tcApplicative, tcOrd, tcSemigroup, tcShow, tcRead, tcFoldable, tcTraversable, tcBounded ]


dUnit : DataType
dUnit =
    DataType "Unit" [ tcEq, tcMonoid, tcOrd, tcSemigroup, tcEnum, tcShow, tcRead, tcBounded ]



----
