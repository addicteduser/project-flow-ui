module View exposing (..)

import Html exposing (Attribute, Html, br, button, div, form, h3, h5, h6, hr, input, label, li, p, small, span, strong, text, ul)
import Html.Attributes exposing (attribute, class, for, id, placeholder, required, step, style, tabindex, type_)
import Html.Events exposing (on, onClick, onInput)
import Json.Decode as Decode
import Model exposing (..)


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
-- CONFIGURATION PANEL
--


viewConfigPanel : Model -> Html Msg
viewConfigPanel model =
    div [ class "row" ]
        [ div [ class "col" ]
            [ h5 [] [ text "Configuration Panel" ]
            , div []
                [ div [ class "form-row" ]
                    [ -- EPOCH
                      div [ class "form-group col" ]
                        [ strong [ style [ ( "font-size", "small" ) ] ] [ text "Epoch" ]
                        , input
                            [ type_ "number"
                            , step "1"
                            , class "form-control"
                            , placeholder "Epoch"
                            , required True
                            , onInput EpochInput
                            ]
                            []
                        ]

                    -- LEARNING RATE
                    , div [ class "form-group col" ]
                        [ strong [ style [ ( "font-size", "small" ) ] ] [ text "Learning Rate" ]
                        , input
                            [ type_ "number"
                            , step "any"
                            , class "form-control"
                            , placeholder "Learning Rate"
                            , required True
                            , onInput LearningRateInput
                            ]
                            []
                        ]
                    ]
                , div [ class "form-group" ]
                    [ div [ class "row" ] [ strong [ class "col", style [ ( "font-size", "small" ) ] ] [ text "SOM Size" ] ]

                    -- SOM SIZE ROW
                    , div [ class "form-row" ]
                        [ div [ class "col-5" ]
                            [ input
                                [ type_ "number"
                                , step "1"
                                , class "form-control"
                                , placeholder "Row"
                                , required True
                                , onInput SomSizeRowInput
                                ]
                                []
                            ]
                        , div
                            [ class "col-2" ]
                            [ div [ style [ ( "text-align", "center" ) ] ] [ text "x" ] ]

                        -- SOM SIZE COL
                        , div [ class "col-5" ]
                            [ input
                                [ type_ "number"
                                , step "1"
                                , class "form-control"
                                , placeholder "Col"
                                , required True
                                , onInput SomSizeColInput
                                ]
                                []
                            ]
                        ]
                    ]

                -- REGIONS
                , div [ class "form-group" ]
                    [ div [ class "form-row" ]
                        [ div [ class "col" ]
                            [ strong [ style [ ( "margin-right", "10px" ) ] ] [ text "Regions" ]
                            , button
                                [ type_ "button"
                                , class "btn btn-secondary btn-sm"
                                , onClick ShowAddRegionModal
                                ]
                                [ text "+" ]
                            ]
                        ]
                    , div [ class "form-row" ]
                        [ div [ class "col" ]
                            [ viewRegions model.regions
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


viewAddRegionModal : Model -> Html Msg
viewAddRegionModal model =
    case model.showModal of
        True ->
            div [ class "mask-style" ]
                [ div [ class "modal-style" ]
                    [ h5 [ class "modal-header-style" ]
                        [ text "Add New Region" ]
                    , div [ class "modal-body-style" ]
                        [ div []
                            [ -- LABEL
                              div [ class "form-group row" ]
                                [ strong [ class "col-2 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Label" ]
                                , div [ class "col-10" ] [ input [ type_ "text", class "form-control form-control-sm", placeholder "Label", onInput LabelInput ] [] ]
                                ]

                            -- TOP LEFT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Top Left" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "tL X", onInput TLxInput ] [] ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "tL Y", onInput TLyInput ] [] ]
                                ]

                            -- TOP RIGHT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Top Right" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "tR X", onInput TRxInput ] [] ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "tR Y", onInput TRyInput ] [] ]
                                ]

                            -- BOTTOM LEFT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Bottom Left" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "bL X", onInput BLxInput ] [] ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "bL Y", onInput BLyInput ] [] ]
                                ]

                            -- BOTTOM RIGHT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Bottom Right" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "bR X", onInput BRxInput ] [] ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ] [ input [ type_ "number", class "form-control form-control-sm", placeholder "bR Y", onInput BRyInput ] [] ]
                                ]
                            ]
                        ]
                    , div [ class "modal-footer" ]
                        [ button
                            [ class "btn btn-secondary btn-sm"
                            , onClick HideAddRegionModal
                            ]
                            [ text "Cancel" ]
                        , button
                            [ class "btn btn-primary btn-sm"
                            , onClick AddNewRegion
                            ]
                            [ text "Add region" ]
                        ]
                    ]
                ]

        False ->
            div [ style [ ( "display", "none" ) ] ] []


viewRegions : List Region -> Html Msg
viewRegions regions =
    if List.isEmpty regions then
        small [] [ text "no added region" ]
    else
        ul [] (List.map viewRegion regions)


viewRegion : Region -> Html Msg
viewRegion region =
    li [] [ small [] [ text (displayRegion region) ] ]


displayRegion : Region -> String
displayRegion region =
    region.label
        ++ " --> tL: "
        ++ displayPoint region.topLeft
        ++ "; tR: "
        ++ displayPoint region.topRight
        ++ "; bL: "
        ++ displayPoint region.bottomLeft
        ++ "; bR: "
        ++ displayPoint region.bottomRight


displayPoint : Point -> String
displayPoint point =
    "(" ++ toString point.x ++ "," ++ toString point.y ++ ")"



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
