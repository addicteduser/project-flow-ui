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


type alias Model =
    { epoch : Int
    , learningRate : Float
    , somSizeRow : Int
    , somSizeCol : Int
    , regions : List Region
    , showModal : Bool
    , modalRegion : Region
    }


model : Model
model =
    { epoch = 0
    , learningRate = 0.0
    , somSizeRow = 0
    , somSizeCol = 0
    , regions = []
    , showModal = False
    , modalRegion = defaultRegion
    }


type alias Region =
    { label : String
    , topLeft : Point
    , topRight : Point
    , bottomLeft : Point
    , bottomRight : Point
    }


type alias Point =
    { x : Int, y : Int }


defaultRegion : Region
defaultRegion =
    { label = ""
    , topLeft = { x = 0, y = 0 }
    , topRight = { x = 0, y = 0 }
    , bottomLeft = { x = 0, y = 0 }
    , bottomRight = { x = 0, y = 0 }
    }
