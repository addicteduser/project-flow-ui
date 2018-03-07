module View.ConfigPanel exposing (viewConfigPanel)

{-| Provides the view code for displaying the Configuration Panel.
-}

--
-- IMPORTS
--

import Helper exposing (getUiValidation)
import Html exposing (Html, button, div, h5, input, li, small, strong, text, ul)
import Html.Attributes exposing (class, disabled, placeholder, required, step, style, type_, value)
import Html.Events exposing (onClick, onInput)
import Model exposing (..)


--
-- CONFIGURATION PANEL
--


{-| View code for displaying the Configuration Panel.

    viewConfigPanel model == Configuration Panel

-}
viewConfigPanel : Model -> Html Msg
viewConfigPanel model =
    let
        ( epochCss, epochMsg ) =
            getUiValidation model.epochValidation "Invalid epoch"

        ( learningRateCss, learningRateMsg ) =
            getUiValidation model.learningRateValidation "Invalid learning rate"

        ( somSizeRowCss, somSizeRowMsg ) =
            getUiValidation model.somSizeRowValidation "Invalid row size"

        ( somSizeColCss, somSizeColMsg ) =
            getUiValidation model.somSizeColValidation "Invalid column size"
    in
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
                            , class ("form-control" ++ epochCss)
                            , placeholder "Epoch"
                            , required True
                            , onInput EpochInput
                            , value model.epoch
                            ]
                            []
                        , div [ class "invalid-feedback" ] [ text epochMsg ]
                        ]

                    -- LEARNING RATE
                    , div [ class "form-group col" ]
                        [ strong [ style [ ( "font-size", "small" ) ] ] [ text "Learning Rate" ]
                        , input
                            [ type_ "number"
                            , step "0.1"
                            , class ("form-control" ++ learningRateCss)
                            , placeholder "Learning Rate"
                            , required True
                            , onInput LearningRateInput
                            , value model.learningRate
                            ]
                            []
                        , div [ class "invalid-feedback" ] [ text learningRateMsg ]
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
                                , class ("form-control" ++ somSizeRowCss)
                                , placeholder "Row"
                                , required True
                                , onInput SomSizeRowInput
                                , value model.somSizeRow
                                ]
                                []
                            , div [ class "invalid-feedback" ] [ text somSizeRowMsg ]
                            ]
                        , div
                            [ class "col-2" ]
                            [ div [ style [ ( "text-align", "center" ) ] ] [ text "x" ] ]

                        -- SOM SIZE COL
                        , div [ class "col-5" ]
                            [ input
                                [ type_ "number"
                                , step "1"
                                , class ("form-control" ++ somSizeColCss)
                                , placeholder "Col"
                                , required True
                                , onInput SomSizeColInput
                                , value model.somSizeCol
                                ]
                                []
                            , div [ class "invalid-feedback" ] [ text somSizeColMsg ]
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
                        [ div [ class "col" ] [ viewRegions model.regions ]
                        ]
                    ]

                -- TRAIN
                , button
                    [ class "btn btn-primary btn-block"
                    , disabled (not model.isConfigInputValid)
                    ]
                    [ text "Train" ]
                ]
            ]
        ]


{-| View code for displaying the list of regions.

    viewRegions regions == Regions list in the user interface

-}
viewRegions : List Region -> Html Msg
viewRegions regions =
    if List.isEmpty regions then
        small [] [ text "no added region" ]
    else
        ul [] (List.map viewRegion regions)


{-| View code for displaying a region list item in viewRegions.

viewRegion region == Region list item

-}
viewRegion : Region -> Html Msg
viewRegion region =
    let
        textRegion =
            " = tL: "
                ++ textPoint region.topLeft
                ++ "; tR: "
                ++ textPoint region.topRight
                ++ "; bL: "
                ++ textPoint region.bottomLeft
                ++ "; bR: "
                ++ textPoint region.bottomRight
    in
    li []
        [ small []
            [ strong [] [ text region.label ]
            , text textRegion
            ]
        ]


{-| Returns the point in (x,y) format.

    textPoint point == "(point.x, point.y)"

-}
textPoint : Point -> String
textPoint point =
    "(" ++ point.x ++ "," ++ point.y ++ ")"
