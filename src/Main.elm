module Main exposing (..)

import Browser
import Data exposing (..)
import Html exposing (Html, div, h1, img, span, table, td, text, th, thead, tr)
import Html.Attributes exposing (class, src)



---- DATA ----
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


typeclassCell : DataType -> Typeclass -> Html Msg
typeclassCell d tc =
    td [] <|
        if List.member tc d.instances then
            [ checkIcon ]

        else
            []


dataRow : DataType -> Html Msg
dataRow d =
    tr [] <|
        td
            []
            [ text d.name ]
            :: List.map (typeclassCell d) allTypeclasses


typeclassHeader : Typeclass -> Html Msg
typeclassHeader tc =
    th [] [ text <| typeclassString tc ]


dataTable : List DataType -> Html Msg
dataTable ds =
    table [] <|
        thead [] (th [] [ text "Name" ] :: List.map typeclassHeader allTypeclasses)
            :: List.map dataRow ds


type MaterialIconName
    = Check


materialIcon : MaterialIconName -> Html Msg
materialIcon name =
    let
        nameString =
            case name of
                Check ->
                    "check"
    in
    span [ class "material-icons" ] [ text nameString ]


checkIcon : Html Msg
checkIcon =
    materialIcon Check


view : Model -> Html Msg
view model =
    div []
        [ dataTable allDataTypes
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
