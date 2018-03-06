module View.ConfigPanel exposing (viewConfigPanel)

import Html exposing (Attribute, Html, br, button, div, form, h3, h5, h6, hr, input, label, li, p, small, span, strong, text, ul)
import Html.Attributes exposing (attribute, class, disabled, for, id, placeholder, required, step, style, tabindex, type_, value)
import Html.Events exposing (on, onClick, onInput)
import Json.Decode as Decode
import Model exposing (..)
import View.AddRegionModal exposing (viewAddRegionModal)


--
-- CONFIGURATION PANEL
--


viewConfigPanel : Model -> Html Msg
viewConfigPanel model =
    let
        ( epochCss, epochMsg ) =
            case model.epochValidation of
                Valid ->
                    ( "", "" )

                Empty ->
                    ( " is-invalid ", "" )

                Invalid ->
                    ( " is-invalid ", "Invalid epoch" )

        ( learningRateCss, learningRateMsg ) =
            case model.learningRateValidation of
                Valid ->
                    ( "", "" )

                Empty ->
                    ( " is-invalid ", "" )

                Invalid ->
                    ( " is-invalid ", "Invalid learning rate" )

        ( somSizeRowCss, somSizeRowMsg ) =
            case model.somSizeRowValidation of
                Valid ->
                    ( "", "" )

                Empty ->
                    ( " is-invalid ", "" )

                Invalid ->
                    ( " is-invalid ", "Invalid input" )

        ( somSizeColCss, somSizeColMsg ) =
            case model.somSizeColValidation of
                Valid ->
                    ( "", "" )

                Empty ->
                    ( " is-invalid ", "" )

                Invalid ->
                    ( " is-invalid ", "Invalid input" )
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
                        [ div [ class "col" ]
                            [ viewRegions model.regions
                            ]
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
