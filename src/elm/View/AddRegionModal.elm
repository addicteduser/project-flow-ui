module View.AddRegionModal exposing (viewAddRegionModal)

{-| Provides the view code for displaying the Add Region Modal.
-}

--
-- IMPORTS
--

import Helper exposing (getUiValidation)
import Html exposing (Html, button, div, h5, input, strong, text)
import Html.Attributes exposing (class, disabled, id, placeholder, required, step, style, type_, value)
import Html.Events exposing (onClick, onInput)
import Model exposing (..)


--
-- ADD REGION MODAL
--


{-| View code for displaying the Add Region Modal.

    viewAddRegionModal model == Add Region Modal

-}
viewAddRegionModal : Model -> Html Msg
viewAddRegionModal { showModal, modalRegion } =
    let
        ( labelCss, labelMsg ) =
            getUiValidation modalRegion.labelValidation "Region label already exists"

        ( ( tLxCss, tLxMsg ), ( tLyCss, tLyMsg ) ) =
            validationState modalRegion.topLeft

        ( ( tRxCss, tRxMsg ), ( tRyCss, tRyMsg ) ) =
            validationState modalRegion.topRight

        ( ( bLxCss, bLxMsg ), ( bLyCss, bLyMsg ) ) =
            validationState modalRegion.bottomLeft

        ( ( bRxCss, bRxMsg ), ( bRyCss, bRyMsg ) ) =
            validationState modalRegion.bottomRight
    in
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
                                        , class ("form-control form-control-sm" ++ labelCss)
                                        , id "addRegionModal"
                                        , placeholder "Label"
                                        , required True
                                        , onInput LabelInput
                                        , value modalRegion.label
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text labelMsg ]
                                    ]
                                ]

                            -- TOP LEFT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Top Left" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ tLxCss)
                                        , placeholder "tL X"
                                        , required True
                                        , onInput TLxInput
                                        , value modalRegion.topLeft.x
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text tLxMsg ]
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ tLyCss)
                                        , placeholder "tL Y"
                                        , required True
                                        , onInput TLyInput
                                        , value modalRegion.topLeft.y
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text tLyMsg ]
                                    ]
                                ]

                            -- TOP RIGHT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Top Right" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ tRxCss)
                                        , placeholder "tR X"
                                        , required True
                                        , onInput TRxInput
                                        , value modalRegion.topRight.x
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text tRxMsg ]
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ tRyCss)
                                        , placeholder "tR Y"
                                        , required True
                                        , onInput TRyInput
                                        , value modalRegion.topRight.y
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text tRyMsg ]
                                    ]
                                ]

                            -- BOTTOM LEFT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Bottom Left" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ bLxCss)
                                        , placeholder "bL X"
                                        , required True
                                        , onInput BLxInput
                                        , value modalRegion.bottomLeft.x
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text bLxMsg ]
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ bLyCss)
                                        , placeholder "bL Y"
                                        , required True
                                        , onInput BLyInput
                                        , value modalRegion.bottomLeft.y
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text bLyMsg ]
                                    ]
                                ]

                            -- BOTTOM RIGHT
                            , div [ class "form-group row" ]
                                [ strong [ class "col-3 col-form-label", style [ ( "font-size", "small" ) ] ] [ text "Bottom Right" ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "X:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ bRxCss)
                                        , placeholder "bR X"
                                        , required True
                                        , onInput BRxInput
                                        , value modalRegion.bottomRight.x
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text bRxMsg ]
                                    ]
                                , strong [ class "col-1 col-form-label modal-point-label" ] [ text "Y:" ]
                                , div [ class "col-3" ]
                                    [ input
                                        [ type_ "number"
                                        , step "1"
                                        , class ("form-control form-control-sm" ++ bRyCss)
                                        , placeholder "bR Y"
                                        , required True
                                        , onInput BRyInput
                                        , value modalRegion.bottomRight.y
                                        ]
                                        []
                                    , div [ class "invalid-feedback" ] [ text bRyMsg ]
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
                            , disabled (not modalRegion.isModalInputValid)
                            , onClick AddNewRegion
                            ]
                            [ text "Add region" ]
                        ]
                    ]
                ]

        False ->
            div [ style [ ( "display", "none" ) ] ] []


{-| Returns the UI validation indicators of a point.

    validationState point == ((xCss,xMsg), (yCss,yMsg))

-}
validationState : Point -> ( ( String, String ), ( String, String ) )
validationState point =
    ( getUiValidation point.xValidation "Invalid x-coordinate"
    , getUiValidation point.yValidation "Invalid y-coordinate"
    )
