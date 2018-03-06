module View.AddRegionModal exposing (viewAddRegionModal)

import Html exposing (Attribute, Html, br, button, div, form, h3, h5, h6, hr, input, label, li, p, small, span, strong, text, ul)
import Html.Attributes exposing (attribute, class, disabled, for, id, placeholder, required, step, style, tabindex, type_, value)
import Html.Events exposing (on, onClick, onInput)
import Json.Decode as Decode
import Model exposing (..)


viewAddRegionModal : Model -> Html Msg
viewAddRegionModal { showModal, modalRegion } =
    case showModal of
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
                                , div [ class "col-10" ]
                                    [ input
                                        [ type_ "text"
                                        , class "form-control form-control-sm"
                                        , placeholder "Label"
                                        , onInput LabelInput
                                        , value modalRegion.label
                                        ]
                                        []
                                    ]
                                ]

                            -- TOP LEFT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Top Left" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "tL X"
                                        , onInput TLxInput
                                        , value modalRegion.topLeft.x
                                        ]
                                        []
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "tL Y"
                                        , onInput TLyInput
                                        , value modalRegion.topLeft.y
                                        ]
                                        []
                                    ]
                                ]

                            -- TOP RIGHT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Top Right" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "tR X"
                                        , onInput TRxInput
                                        , value modalRegion.topRight.x
                                        ]
                                        []
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "tR Y"
                                        , onInput TRyInput
                                        , value modalRegion.topRight.y
                                        ]
                                        []
                                    ]
                                ]

                            -- BOTTOM LEFT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Bottom Left" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "bL X"
                                        , onInput BLxInput
                                        , value modalRegion.bottomLeft.x
                                        ]
                                        []
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "bL Y"
                                        , onInput BLyInput
                                        , value modalRegion.bottomLeft.y
                                        ]
                                        []
                                    ]
                                ]

                            -- BOTTOM RIGHT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Bottom Right" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "bR X"
                                        , onInput BRxInput
                                        , value modalRegion.bottomRight.x
                                        ]
                                        []
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , class "form-control form-control-sm"
                                        , placeholder "bR Y"
                                        , onInput BRyInput
                                        , value modalRegion.bottomRight.y
                                        ]
                                        []
                                    ]
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
