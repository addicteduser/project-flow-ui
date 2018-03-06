module Update exposing (..)

import Helper exposing (..)
import Model exposing (..)
import Ports exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        _ =
            Debug.log "(msg, model)" ( msg, model )
    in
    case msg of
        NoOp ->
            ( model, Cmd.none )

        -- CONFIGURATION PANEL
        EpochInput updatedEpoch ->
            let
                updatedModel =
                    { model | epoch = updatedEpoch }
            in
            ( validate updatedModel, Cmd.none )

        LearningRateInput updatedLearningRate ->
            let
                updatedModel =
                    { model | learningRate = updatedLearningRate }
            in
            ( validate updatedModel, Cmd.none )

        SomSizeRowInput updatedSomSizeRow ->
            let
                updatedModel =
                    { model | somSizeRow = updatedSomSizeRow }
            in
            ( validate updatedModel, Cmd.none )

        SomSizeColInput updatedSomSizeCol ->
            let
                intSomSizeCol =
                    updatedSomSizeCol |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                updatedModel =
                    { model | somSizeCol = updatedSomSizeCol }
            in
            ( validate updatedModel, Cmd.none )

        -- REGION MODAL
        ShowAddRegionModal ->
            let
                updatedModel =
                    { model | showModal = True }
            in
            ( updatedModel, Cmd.none )

        HideAddRegionModal ->
            let
                updatedModel =
                    { model | showModal = False }
            in
            ( updatedModel, Cmd.none )

        AddNewRegion ->
            let
                updatedModel =
                    { model
                        | regions = List.append model.regions [ model.modalRegion ]
                        , modalRegion = defaultRegion
                        , showModal = False
                    }
            in
            ( updatedModel, Cmd.none )

        LabelInput updatedLabel ->
            let
                modalRegion =
                    model.modalRegion

                updatedModalRegion =
                    { modalRegion | label = updatedLabel }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TLxInput updatedTLx ->
            let
                intTLx =
                    updatedTLx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                topLeft =
                    modalRegion.topLeft

                updatedTopLeft =
                    { topLeft | x = updatedTLx }

                updatedModalRegion =
                    { modalRegion | topLeft = updatedTopLeft }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TLyInput updatedTLy ->
            let
                intTLy =
                    updatedTLy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                topLeft =
                    modalRegion.topLeft

                updatedTopLeft =
                    { topLeft | y = updatedTLy }

                updatedModalRegion =
                    { modalRegion | topLeft = updatedTopLeft }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TRxInput updatedTRx ->
            let
                intTRx =
                    updatedTRx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                topRight =
                    modalRegion.topRight

                updatedTopRight =
                    { topRight | x = updatedTRx }

                updatedModalRegion =
                    { modalRegion | topRight = updatedTopRight }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TRyInput updatedTRy ->
            let
                intTRy =
                    updatedTRy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                topRight =
                    modalRegion.topRight

                updatedTopRight =
                    { topRight | y = updatedTRy }

                updatedModalRegion =
                    { modalRegion | topRight = updatedTopRight }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BLxInput updatedBLx ->
            let
                intBLx =
                    updatedBLx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                bottomLeft =
                    modalRegion.bottomLeft

                updatedBottomLeft =
                    { bottomLeft | x = updatedBLx }

                updatedModalRegion =
                    { modalRegion | bottomLeft = updatedBottomLeft }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BLyInput updatedBLy ->
            let
                intBLy =
                    updatedBLy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                bottomLeft =
                    modalRegion.bottomLeft

                updatedBottomLeft =
                    { bottomLeft | y = updatedBLy }

                updatedModalRegion =
                    { modalRegion | bottomLeft = updatedBottomLeft }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BRxInput updatedBRx ->
            let
                intBRx =
                    updatedBRx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                bottomRight =
                    modalRegion.bottomRight

                updatedBottomRight =
                    { bottomRight | x = updatedBRx }

                updatedModalRegion =
                    { modalRegion | bottomRight = updatedBottomRight }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BRyInput updatedBRy ->
            let
                intBRy =
                    updatedBRy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

                modalRegion =
                    model.modalRegion

                bottomRight =
                    modalRegion.bottomRight

                updatedBottomRight =
                    { bottomRight | y = updatedBRy }

                updatedModalRegion =
                    { modalRegion | bottomRight = updatedBottomRight }

                updatedModel =
                    { model | modalRegion = updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        -- DATASET PANEL
        FileSelected ->
            ( model, fileSelectedPort () )


validate : Model -> Model
validate model =
    let
        updatedEpochValidation =
            if String.isEmpty model.epoch then
                Empty
            else if isPositiveInteger (Helper.toInt model.epoch) then
                Valid
            else
                Invalid

        updatedLearningRateValidation =
            if String.isEmpty model.learningRate then
                Empty
            else if isPositiveFloat (Helper.toFloat model.learningRate) then
                Valid
            else
                Invalid

        updatedSomSizeRowValidation =
            if String.isEmpty model.somSizeRow then
                Empty
            else if isPositiveInteger (Helper.toInt model.somSizeRow) then
                Valid
            else
                Invalid

        updatedSomSizeColValidation =
            if String.isEmpty model.somSizeCol then
                Empty
            else if isPositiveInteger (Helper.toInt model.somSizeCol) then
                Valid
            else
                Invalid

        updatedConfigStatus =
            if
                (updatedEpochValidation == Valid)
                    && (updatedLearningRateValidation == Valid)
                    && (updatedSomSizeRowValidation == Valid)
                    && (updatedSomSizeColValidation == Valid)
            then
                True
            else
                False
    in
    { model
        | epochValidation = updatedEpochValidation
        , learningRateValidation = updatedLearningRateValidation
        , somSizeRowValidation = updatedSomSizeRowValidation
        , somSizeColValidation = updatedSomSizeColValidation
        , isConfigValid = updatedConfigStatus
    }
