module Model exposing (..)

{-| Provides the union types and type aliases.
-}

--
-- MODEL
--


{-| For evant-handling.
-}
type Msg
    = NoOp
      -- CONFIGURATION PANEL
    | EpochInput String
    | LearningRateInput String
    | SomSizeRowInput String
    | SomSizeColInput String
      -- REGION MODAL
    | ShowAddRegionModal
    | HideAddRegionModal
    | AddNewRegion
    | LabelInput String
    | TLxInput String
    | TLyInput String
    | TRxInput String
    | TRyInput String
    | BLxInput String
    | BLyInput String
    | BRxInput String
    | BRyInput String
      -- DATASET PANEL
    | FileSelected


{-| For input validation.
-}
type ValidationState
    = Valid
    | Empty
    | Invalid


{-| The main model of the application.
-}
type alias Model =
    { epoch : String
    , epochValidation : ValidationState
    , learningRate : String
    , learningRateValidation : ValidationState
    , somSizeRow : String
    , somSizeRowValidation : ValidationState
    , somSizeCol : String
    , somSizeColValidation : ValidationState
    , regions : List Region
    , showModal : Bool
    , modalRegion : Region
    , isConfigInputValid : Bool
    }


{-| Default Model specifications.
-}
model : Model
model =
    { epoch = "1"
    , epochValidation = Valid
    , learningRate = "0.5"
    , learningRateValidation = Valid
    , somSizeRow = "1"
    , somSizeRowValidation = Valid
    , somSizeCol = "1"
    , somSizeColValidation = Valid
    , regions = []
    , showModal = False
    , modalRegion = defaultRegion
    , isConfigInputValid = True
    }


{-| Model representation of a region.
-}
type alias Region =
    { label : String
    , labelValidation : ValidationState
    , topLeft : Point
    , topRight : Point
    , bottomLeft : Point
    , bottomRight : Point
    , isModalInputValid : Bool
    }


{-| Default Region specifications.
-}
defaultRegion : Region
defaultRegion =
    { label = ""
    , labelValidation = Empty
    , topLeft = defaultPoint
    , topRight = defaultPoint
    , bottomLeft = defaultPoint
    , bottomRight = defaultPoint
    , isModalInputValid = False
    }


{-| Model representation of a point.
-}
type alias Point =
    { x : String
    , xValidation : ValidationState
    , y : String
    , yValidation : ValidationState
    }


{-| Default Point specifications.
-}
defaultPoint : Point
defaultPoint =
    { x = "0"
    , xValidation = Valid
    , y = "0"
    , yValidation = Valid
    }
