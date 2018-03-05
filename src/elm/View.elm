module View exposing (..)

import Html exposing (beginnerProgram, br, button, div, form, h5, h6, hr, input, label, small, strong, text)
import Html.Attributes exposing (class, for, id, placeholder, required, step, style, type_)
import Html.Events exposing (onClick)
import Model exposing (..)


view model =
    div [ class "container" ]
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
            ]
        ]



--
-- CONFIGURATION PANEL
--


viewConfigPanel model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ h5 [] [ text "Configuration Panel" ]
            , div []
                [ div [ class "form-row" ]
                    [ div [ class "form-group col" ]
                        [ strong [ style [ ( "font-size", "small" ) ] ] [ text "Epoch" ]
                        , input
                            [ type_ "number"
                            , step "1"
                            , class "form-control"
                            , placeholder "Epoch"
                            , required True
                            ]
                            []
                        ]
                    , div [ class "form-group col" ]
                        [ strong [ style [ ( "font-size", "small" ) ] ] [ text "Learning Rate" ]
                        , input
                            [ type_ "number"
                            , step "any"
                            , class "form-control"
                            , placeholder "Learning Rate"
                            , required True
                            ]
                            []
                        ]
                    ]
                , div [ class "form-group" ]
                    [ div [ class "row" ] [ strong [ class "col", style [ ( "font-size", "small" ) ] ] [ text "SOM Size" ] ]
                    , div [ class "form-row" ]
                        [ div [ class "col-5" ]
                            [ input
                                [ type_ "number"
                                , step "1"
                                , class "form-control"
                                , placeholder "Row"
                                , required True
                                ]
                                []
                            ]
                        , div
                            [ class "col-2" ]
                            [ div [ style [ ( "text-align", "center" ) ] ] [ text "x" ] ]
                        , div [ class "col-5" ]
                            [ input
                                [ type_ "number"
                                , step "1"
                                , class "form-control"
                                , placeholder "Col"
                                , required True
                                ]
                                []
                            ]
                        ]
                    ]
                , div [ class "form-group" ]
                    [ div [ class "form-row" ]
                        [ div [ class "col" ]
                            [ strong [ style [ ( "margin-right", "10px" ) ] ] [ text "Add Region" ]
                            , button [ class "btn btn-secondary btn-sm" ] [ text "+" ]
                            ]
                        ]
                    , div [ class "form-row" ]
                        [ div [ class "col" ]
                            [ text "region list"
                            ]
                        ]
                    ]
                , button
                    [ class "btn btn-primary btn-block"
                    ]
                    [ text "Train" ]
                ]
            ]
        ]



--
-- DATASET PANEL
--


viewDatasetPanel model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ h5 [] [ text "Dataset Panel" ]
            , div [ class "custom-file" ]
                [ input [ type_ "file", id "customFile" ] []

                -- class "custom-file-input",, label [ class "custom-file-label", for "customFile" ] [ text "Choose" ]
                ]
            ]
        ]



--
-- SOM VISUALIZATION PANEL
--


viewSomVisualizationPanel model =
    div [] [ h5 [] [ text "SOM VISUALIZATION" ] ]
