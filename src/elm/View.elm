module View exposing (..)

import Html exposing (Attribute, Html, br, button, div, form, h3, h5, h6, hr, input, label, li, p, small, span, strong, text, ul)
import Html.Attributes exposing (attribute, class, disabled, for, id, placeholder, required, step, style, tabindex, type_, value)
import Html.Events exposing (on, onClick, onInput)
import Json.Decode as Decode
import Model exposing (..)
import View.AddRegionModal exposing (viewAddRegionModal)
import View.ConfigPanel exposing (viewConfigPanel)


view : Model -> Html Msg
view model =
    div [ class "container-fluid" ]
        [ div [ class "row" ]
            [ div [ class "col-4" ]
                [ viewConfigPanel model
                , hr [] []
                , viewDatasetPanel model
                ]
            , div
                [ class "col-8"
                , style [ ( "border-left", "thin solid #888888" ) ]
                ]
                [ viewSomVisualizationPanel model ]
            , viewAddRegionModal model
            ]
        ]



--
-- DATASET PANEL
--


viewDatasetPanel : Model -> Html Msg
viewDatasetPanel model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ h5 [] [ text "Dataset Panel" ]
            , div []
                [ input
                    [ type_ "file"
                    , id "fileInput"
                    , on "change" (Decode.succeed FileSelected)
                    ]
                    []
                ]
            ]
        ]



--
-- SOM VISUALIZATION PANEL
--


viewSomVisualizationPanel : Model -> Html Msg
viewSomVisualizationPanel model =
    div []
        [ h5 [] [ text "SOM Visualization Panel" ]
        , div [ id "som-vis" ] []
        ]
