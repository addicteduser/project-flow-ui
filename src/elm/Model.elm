module Model exposing (..)


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


type ValidationState
    = Valid
    | Empty
    | Invalid


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


type alias Region =
    { label : String
    , labelValidation : ValidationState
    , topLeft : Point
    , topRight : Point
    , bottomLeft : Point
    , bottomRight : Point
    , isModalInputValid : Bool
    }


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


type alias Point =
    { x : String
    , xValidation : ValidationState
    , y : String
    , yValidation : ValidationState
    }


defaultPoint : Point
defaultPoint =
    { x = "0"
    , xValidation = Valid
    , y = "0"
    , yValidation = Valid
    }
