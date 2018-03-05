module View exposing (..)

import Dialog
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
            div [ maskStyle ]
                [ div [ modalStyle ]
                    [ h3 [ modalHeaderStyle ]
                        [ text "Are you sure you want to blow up the world?" ]
                    , div [ modalBodyStyle ]
                        [ p []
                            [ text "This action cannot be reverted. Once confirmed we will all meet our maker, whoever she is." ]
                        ]
                    , div []
                        [ button [ onClick HideAddRegionModal ]
                            [ text "Oh hell no!" ]
                        , button [ onClick HideAddRegionModal ]
                            [ text "Yes, blow it up!" ]
                        ]
                    ]
                ]

        False ->
            div [ style [ ( "display", "none" ) ] ] []


maskStyle : Attribute msg
maskStyle =
    style
        [ ( "background-color", "rgba(0,0,0,0.3)" )
        , ( "position", "fixed" )
        , ( "top", "0" )
        , ( "left", "0" )
        , ( "width", "100%" )
        , ( "height", "100%" )
        ]


modalStyle : Attribute msg
modalStyle =
    style
        [ ( "background-color", "rgba(255,255,255,1.0)" )
        , ( "position", "absolute" )
        , ( "top", "50%" )
        , ( "left", "50%" )
        , ( "height", "auto" )
        , ( "max-height", "80%" )
        , ( "width", "700px" )
        , ( "max-width", "95%" )
        , ( "padding", "10px" )
        , ( "border-radius", "3px" )
        , ( "box-shadow", "1px 1px 5px rgba(0,0,0,0.5)" )
        , ( "transform", "translate(-50%, -50%)" )
        , ( "opacity", "1" )
        ]


modalHeaderStyle : Attribute msg
modalHeaderStyle =
    style
        [ ( "padding", "10px" )
        , ( "margin", "0px" )
        , ( "border-bottom", "1px solid rgba(0,0,0,0.3)" )
        ]


modalBodyStyle : Attribute msg
modalBodyStyle =
    style
        [ ( "padding", "10px" )
        ]


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
