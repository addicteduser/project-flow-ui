module View.AddRegionModal exposing (viewAddRegionModal)

import Html exposing (Attribute, Html, br, button, div, form, h3, h5, h6, hr, input, label, li, p, small, span, strong, text, ul)
import Html.Attributes exposing (attribute, class, disabled, for, id, placeholder, required, step, style, tabindex, type_, value)
import Html.Events exposing (on, onClick, onInput)
import Json.Decode as Decode
import Model exposing (..)


viewAddRegionModal : Model -> Html Msg
viewAddRegionModal { showModal, modalRegion } =
    let
        ( labelCss, labelMsg ) =
            case modalRegion.labelValidation of
                Valid ->
                    ( "", "" )

                _ ->
                    ( " is-invalid ", "" )

        ( tLxCss, tLxMsg, tLyCss, tLyMsg ) =
            validationState modalRegion.topLeft

        ( tRxCss, tRxMsg, tRyCss, tRyMsg ) =
            validationState modalRegion.topRight

        ( bLxCss, bLxMsg, bLyCss, bLyMsg ) =
            validationState modalRegion.bottomLeft

        ( bRxCss, bRxMsg, bRyCss, bRyMsg ) =
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
                                        , class ("form-control form-control-sm" ++ tLxCss)
                                        , placeholder "tL X"
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
                                        , class ("form-control form-control-sm" ++ tLyCss)
                                        , placeholder "tL Y"
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
                                        , class ("form-control form-control-sm" ++ tRxCss)
                                        , placeholder "tR X"
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
                                        , class ("form-control form-control-sm" ++ tRyCss)
                                        , placeholder "tR Y"
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
                                        , class ("form-control form-control-sm" ++ bLxCss)
                                        , placeholder "bL X"
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
                                        , class ("form-control form-control-sm" ++ bLyCss)
                                        , placeholder "bL Y"
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
                                        , class ("form-control form-control-sm" ++ bRxCss)
                                        , placeholder "bR X"
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
                                        , class ("form-control form-control-sm" ++ bRyCss)
                                        , placeholder "bR Y"
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


validationState : Point -> ( String, String, String, String )
validationState point =
    let
        ( xCss, xMsg ) =
            case point.xValidation of
                Valid ->
                    ( "", "" )

                Empty ->
                    ( " is-invalid ", "" )

                Invalid ->
                    ( " is-invalid ", "Invalid x-coordinate" )

        ( yCss, yMsg ) =
            case point.yValidation of
                Valid ->
                    ( "", "" )

                Empty ->
                    ( " is-invalid ", "" )

                Invalid ->
                    ( " is-invalid ", "Invalid y-coordinate" )
    in
    ( xCss, xMsg, yCss, yMsg )
