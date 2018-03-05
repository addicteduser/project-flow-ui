module Update exposing (..)

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
        EpochInput strEpoch ->
            let
                updatedEpoch =
                    strEpoch |> String.toInt |> Result.toMaybe |> Maybe.withDefault model.epoch

                updatedModel =
                    { model | epoch = updatedEpoch }
            in
            ( updatedModel, Cmd.none )

        LearningRateInput strLearningRate ->
            let
                updatedLearningRate =
                    strLearningRate |> String.toFloat |> Result.toMaybe |> Maybe.withDefault model.learningRate

                updatedModel =
                    { model | learningRate = updatedLearningRate }
            in
            ( updatedModel, Cmd.none )

        SomSizeRowInput strSomSizeRow ->
            let
                updatedSomSizeRow =
                    strSomSizeRow |> String.toInt |> Result.toMaybe |> Maybe.withDefault model.somSizeRow

                updatedModel =
                    { model | somSizeRow = updatedSomSizeRow }
            in
            ( updatedModel, Cmd.none )

        SomSizeColInput strSomSizeCol ->
            let
                updatedSomSizeCol =
                    strSomSizeCol |> String.toInt |> Result.toMaybe |> Maybe.withDefault model.somSizeCol

                updatedModel =
                    { model | somSizeCol = updatedSomSizeCol }
            in
            ( updatedModel, Cmd.none )

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

        TLxInput strTLx ->
            let
                updatedTLx =
                    strTLx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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

        TLyInput strTLy ->
            let
                updatedTLy =
                    strTLy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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

        TRxInput strTRx ->
            let
                updatedTRx =
                    strTRx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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

        TRyInput strTRy ->
            let
                updatedTRy =
                    strTRy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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

        BLxInput strBLx ->
            let
                updatedBLx =
                    strBLx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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

        BLyInput strBLy ->
            let
                updatedBLy =
                    strBLy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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

        BRxInput strBRx ->
            let
                updatedBRx =
                    strBRx |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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

        BRyInput strBRy ->
            let
                updatedBRy =
                    strBRy |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0

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
