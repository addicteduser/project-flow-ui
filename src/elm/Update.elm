module Update exposing (update)

{-| Provides the handler for updating the application.
-}

--
-- IMPORTS
--

import Dom
import Helper exposing (doesRegionLabelExist, isPointValid, isPositiveFloat, isPositiveInteger, isValidPointCoordinate)
import Model exposing (..)
import Ports exposing (fileSelectedPort)
import Task


{-| Handles what happens when msg is invoked.

    update msg model == (updatedModel, cmdMsg)

-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    -- let
    --     _ =
    --         Debug.log "(msg, model)" ( msg, model )
    -- in
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
            ( updatedModel, Task.attempt (always NoOp) <| Dom.focus "addRegionModal" )

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
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TLxInput updatedTLx ->
            let
                modalRegion =
                    model.modalRegion

                topLeft =
                    modalRegion.topLeft

                updatedTopLeft =
                    { topLeft | x = updatedTLx }

                updatedModalRegion =
                    { modalRegion | topLeft = updatedTopLeft }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TLyInput updatedTLy ->
            let
                modalRegion =
                    model.modalRegion

                topLeft =
                    modalRegion.topLeft

                updatedTopLeft =
                    { topLeft | y = updatedTLy }

                updatedModalRegion =
                    { modalRegion | topLeft = updatedTopLeft }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TRxInput updatedTRx ->
            let
                modalRegion =
                    model.modalRegion

                topRight =
                    modalRegion.topRight

                updatedTopRight =
                    { topRight | x = updatedTRx }

                updatedModalRegion =
                    { modalRegion | topRight = updatedTopRight }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        TRyInput updatedTRy ->
            let
                modalRegion =
                    model.modalRegion

                topRight =
                    modalRegion.topRight

                updatedTopRight =
                    { topRight | y = updatedTRy }

                updatedModalRegion =
                    { modalRegion | topRight = updatedTopRight }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BLxInput updatedBLx ->
            let
                modalRegion =
                    model.modalRegion

                bottomLeft =
                    modalRegion.bottomLeft

                updatedBottomLeft =
                    { bottomLeft | x = updatedBLx }

                updatedModalRegion =
                    { modalRegion | bottomLeft = updatedBottomLeft }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BLyInput updatedBLy ->
            let
                modalRegion =
                    model.modalRegion

                bottomLeft =
                    modalRegion.bottomLeft

                updatedBottomLeft =
                    { bottomLeft | y = updatedBLy }

                updatedModalRegion =
                    { modalRegion | bottomLeft = updatedBottomLeft }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BRxInput updatedBRx ->
            let
                modalRegion =
                    model.modalRegion

                bottomRight =
                    modalRegion.bottomRight

                updatedBottomRight =
                    { bottomRight | x = updatedBRx }

                updatedModalRegion =
                    { modalRegion | bottomRight = updatedBottomRight }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        BRyInput updatedBRy ->
            let
                modalRegion =
                    model.modalRegion

                bottomRight =
                    modalRegion.bottomRight

                updatedBottomRight =
                    { bottomRight | y = updatedBRy }

                updatedModalRegion =
                    { modalRegion | bottomRight = updatedBottomRight }

                updatedModel =
                    { model | modalRegion = validateModalRegion model updatedModalRegion }
            in
            ( updatedModel, Cmd.none )

        -- DATASET PANEL
        FileSelected ->
            ( model, fileSelectedPort () )


{-| Updates the validationStates of the Configuration Panel inputs.

    validate model == updatedModel

-}
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
        , isConfigInputValid = updatedConfigStatus
    }


{-| Updates the validationStates of the Add Region Modal inputs.

    validateModalRegion model region == updatedModalRegion

-}
validateModalRegion : Model -> Region -> Region
validateModalRegion { regions, somSizeRow, somSizeCol } region =
    let
        updatedLabelValidation =
            if String.isEmpty region.label then
                Empty
            else if doesRegionLabelExist region.label regions then
                Invalid
            else
                Valid

        updatedTopLeft =
            validatePoint region.topLeft somSizeRow somSizeCol

        updatedTopRight =
            validatePoint region.topRight somSizeRow somSizeCol

        updatedBottomLeft =
            validatePoint region.bottomLeft somSizeRow somSizeCol

        updatedBottomRight =
            validatePoint region.bottomRight somSizeRow somSizeCol

        updatedModalStatus =
            if
                (updatedLabelValidation == Valid)
                    && isPointValid updatedTopLeft
                    && isPointValid updatedTopRight
                    && isPointValid updatedBottomLeft
                    && isPointValid updatedBottomRight
            then
                True
            else
                False
    in
    { region
        | labelValidation = updatedLabelValidation
        , topLeft = updatedTopLeft
        , topRight = updatedTopRight
        , bottomLeft = updatedBottomLeft
        , bottomRight = updatedBottomRight
        , isModalInputValid = updatedModalStatus
    }


{-| Updates the validateionStates of a point in a region.

    validatePoint point row col == updatedPoint

-}
validatePoint : Point -> String -> String -> Point
validatePoint point row col =
    let
        updatedXValidation =
            if String.isEmpty point.x then
                Empty
            else if isValidPointCoordinate (Helper.toInt point.x) (Helper.toInt row) then
                Valid
            else
                Invalid

        updatedYValidation =
            if String.isEmpty point.y then
                Empty
            else if isValidPointCoordinate (Helper.toInt point.y) (Helper.toInt col) then
                Valid
            else
                Invalid
    in
    { point
        | xValidation = updatedXValidation
        , yValidation = updatedYValidation
    }
