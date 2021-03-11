module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, table, td, text, th, thead, tr)
import Html.Attributes exposing (src)



---- DATA ----


type alias DataType =
    { name : String
    , isMonoid : Bool
    , isFunctor : Bool
    , isApplicative : Bool
    , isMonad : Bool
    }


data : List DataType
data =
    [ { name = "Maybe", isMonoid = True, isFunctor = True, isApplicative = True, isMonad = True }
    , { name = "Either", isMonoid = True, isFunctor = True, isApplicative = True, isMonad = True }
    , { name = "List", isMonoid = True, isFunctor = True, isApplicative = True, isMonad = True }
    ]



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


stringFromBool : Bool -> String
stringFromBool x =
    if x then
        "True"

    else
        "False"


dataRow : DataType -> Html Msg
dataRow d =
    tr []
        [ td [] [ text d.name ]
        , td [] [ text <| stringFromBool d.isMonoid ]
        , td [] [ text <| stringFromBool d.isFunctor ]
        , td [] [ text <| stringFromBool d.isApplicative ]
        , td [] [ text <| stringFromBool d.isMonad ]
        ]


dataTable : List DataType -> Html Msg
dataTable ds =
    table [] <|
        thead []
            [ th [] [ text "Name" ]
            , th [] [ text "Is Monoid" ]
            , th [] [ text "Is Functor" ]
            , th [] [ text "Is Applicative" ]
            , th [] [ text "Is Monad" ]
            ]
            :: List.map dataRow ds


view : Model -> Html Msg
view model =
    div []
        [ dataTable data
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
