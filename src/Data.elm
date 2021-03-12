module Data exposing (..)

---- DATA MODEL ----


type alias Package =
    List String


type alias Typeclass =
    { name : String
    , package : Package
    }


typeclassString : Typeclass -> String
typeclassString tc =
    tc.name


type alias DataType =
    { name : String
    , package : Package
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
    Typeclass "Eq" [ "GHC", "Classes" ]


tcOrd : Typeclass
tcOrd =
    Typeclass "Ord" [ "GHC", "Classes" ]


tcShow : Typeclass
tcShow =
    Typeclass "Show" [ "GHC", "Show" ]


tcRead : Typeclass
tcRead =
    Typeclass "Read" [ "GHC", "Read" ]


tcMonadFail : Typeclass
tcMonadFail =
    Typeclass "MonadFail" [ "Control.Monad.Fail" ]


tcFoldable : Typeclass
tcFoldable =
    Typeclass "Foldable" [ "Data", "Foldable" ]


tcTraversable : Typeclass
tcTraversable =
    Typeclass "Traversable" [ "Data", "Traversable" ]


tcSemigroup : Typeclass
tcSemigroup =
    Typeclass "Semigroup" [ "GHC", "Base" ]


tcMonoid : Typeclass
tcMonoid =
    Typeclass "Monoid" [ "GHC", "Base" ]


tcFunctor : Typeclass
tcFunctor =
    Typeclass "Functor" [ "GHC", "Base" ]


tcApplicative : Typeclass
tcApplicative =
    Typeclass "Applicative" [ "GHC", "Base" ]


tcMonad : Typeclass
tcMonad =
    Typeclass "Monad" [ "GHC", "Base" ]


tcBounded : Typeclass
tcBounded =
    Typeclass "Bounded" [ "GHC", "Enum" ]


tcEnum : Typeclass
tcEnum =
    Typeclass "Enum" [ "GHC", "Enum" ]


preludeDataTypes : List DataType
preludeDataTypes =
    [ dMaybe, dOrdering, dEither, dList, dIO, dFn, dTuple, dUnit ]


dMaybe : DataType
dMaybe =
    DataType
        "Maybe"
        [ "GHC", "Maybe" ]
        [ tcEq, tcOrd, tcShow, tcRead, tcMonadFail, tcFoldable, tcTraversable, tcSemigroup, tcMonoid, tcFunctor, tcApplicative, tcMonad ]


dOrdering : DataType
dOrdering =
    DataType
        "Ordering"
        [ "GHC", "Types" ]
        [ tcEq, tcMonoid, tcOrd, tcSemigroup, tcEnum, tcShow, tcRead, tcBounded ]


dEither : DataType
dEither =
    DataType
        "Either"
        [ "Data", "Either" ]
        [ tcApplicative, tcEq, tcFunctor, tcMonad, tcOrd, tcSemigroup, tcShow, tcRead, tcFoldable, tcTraversable ]


dList : DataType
dList =
    DataType
        "List"
        [ "GHC", "Types" ]
        [ tcApplicative, tcEq, tcFunctor, tcMonad, tcMonoid, tcOrd, tcSemigroup, tcShow, tcMonadFail, tcRead, tcFoldable, tcTraversable ]


dIO : DataType
dIO =
    DataType
        "IO"
        [ "GHC", "Types" ]
        [ tcApplicative, tcFunctor, tcMonad, tcMonoid, tcSemigroup, tcMonadFail ]


dFn : DataType
dFn =
    DataType
        "->"
        [ "GHC", "Prim" ]
        [ tcApplicative, tcFunctor, tcMonad, tcMonoid, tcSemigroup ]


dTuple : DataType
dTuple =
    DataType
        "Tuple"
        [ "GHC", "Tuple" ]
        [ tcMonoid, tcEq, tcFunctor, tcMonad, tcApplicative, tcOrd, tcSemigroup, tcShow, tcRead, tcFoldable, tcTraversable, tcBounded ]


dUnit : DataType
dUnit =
    DataType
        "Unit"
        [ "GHC.Tuple" ]
        [ tcEq, tcMonoid, tcOrd, tcSemigroup, tcEnum, tcShow, tcRead, tcBounded ]
