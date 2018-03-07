module View exposing (view)

{-| The entry point for the main view code of the application.
-}

--
--IMPORTS
--

import Html exposing (Html, div, h5, hr, input, text)
import Html.Attributes exposing (class, id, style, type_)
import Html.Events exposing (on)
import Json.Decode as Decode
import Model exposing (Model, Msg(FileSelected))
import View.AddRegionModal exposing (viewAddRegionModal)
import View.ConfigPanel exposing (viewConfigPanel)


{-| The entry point of the view code.

    view model == Application User Interface

-}
view : Model -> Html Msg
view model =
    div [ class "container-fluid" ]
        [ div [ class "row" ]
            [ div [ class "col-4" ]
                [ viewConfigPanel model
                , hr [] []
                , viewDatasetPanel
                ]
            , div
                [ class "col-8"
                , style [ ( "border-left", "thin solid #888888" ) ]
                ]
                [ viewSomVisualizationPanel ]
            , viewAddRegionModal model
            ]
        ]



--
-- DATASET PANEL
--


{-| View code for displaying the Dataset Panel.

    viewDatasetPanel == Dataset Panel

-}
viewDatasetPanel : Html Msg
viewDatasetPanel =
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


{-| View code for displaying the SOM Visualization Panel.

    viewSomVisualizationPanel == SOM Visualization Panel

-}
viewSomVisualizationPanel : Html Msg
viewSomVisualizationPanel =
    div []
        [ h5 [] [ text "SOM Visualization Panel" ]
        , div [ id "som-vis" ] []
        ]
