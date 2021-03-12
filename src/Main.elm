module Main exposing (..)

import Browser
import Data exposing (..)
import Html exposing (Html, br, div, h1, img, span, table, td, text, th, thead, tr)
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


dataTypeCell : List Instance -> DataType -> Typeclass -> Html Msg
dataTypeCell insts dt tc =
    td [] <|
        if Data.hasInstance insts tc.name dt.name then
            [ checkIcon ]

        else
            []


dataTypeRow : List Typeclass -> List Instance -> DataType -> Html Msg
dataTypeRow tcs insts dt =
    tr [] <|
        [ td
            []
            [ text dt.name ]
        , td [] [ text <| String.join "." dt.package ]
        ]
            ++ List.map (dataTypeCell insts dt) tcs


typeclassHeader : Typeclass -> Html Msg
typeclassHeader tc =
    th [] [ text <| typeclassString tc ]


dataTypeTable : List Typeclass -> List Instance -> List DataType -> Html Msg
dataTypeTable tcs insts dts =
    table [] <|
        thead [] ([ th [] [ text "Name" ], th [] [ text "Package" ] ] ++ List.map typeclassHeader tcs)
            :: List.map (dataTypeRow tcs insts) dts


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


typeclassCell : List Instance -> Typeclass -> DataType -> Html Msg
typeclassCell insts tc dt =
    dataTypeCell insts dt tc


typeclassRow : List DataType -> List Instance -> Typeclass -> Html Msg
typeclassRow dts insts tc =
    tr [] <|
        [ td
            []
            [ text tc.name ]
        , td [] [ text <| String.join "." tc.package ]
        ]
            ++ List.map (typeclassCell insts tc) dts


dataTypeHeader : DataType -> Html Msg
dataTypeHeader dt =
    th [] [ text <| typeclassString dt ]


typeclassTable : List Typeclass -> List Instance -> List DataType -> Html Msg
typeclassTable tcs insts dts =
    table [] <|
        thead [] ([ th [] [ text "Name" ], th [] [ text "Package" ] ] ++ List.map dataTypeHeader dts)
            :: List.map (typeclassRow dts insts) tcs


view : Model -> Html Msg
view model =
    div []
        [ br [] []
        , dataTypeTable allTypeclasses allInstances allDataTypes
        , br [] []
        , typeclassTable allTypeclasses allInstances allDataTypes
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
