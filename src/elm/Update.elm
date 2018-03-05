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

        -- DATASET PANEL
        FileSelected ->
            ( model, fileSelectedPort () )
