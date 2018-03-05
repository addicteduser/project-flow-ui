module Model exposing (..)


type Msg
    = NoOp
      -- CONFIGURATION PANEL
    | EpochInput String
    | LearningRateInput String
    | SomSizeRowInput String
    | SomSizeColInput String
    | ShowAddRegionModal
    | HideAddRegionModal
      -- DATASET PANEL
    | FileSelected


type alias Model =
    { epoch : Int
    , learningRate : Float
    , somSizeRow : Int
    , somSizeCol : Int
    , regions : List Region
    , showModal : Bool
    }


model : Model
model =
    { epoch = 0
    , learningRate = 0.0
    , somSizeRow = 0
    , somSizeCol = 0
    , regions = [ dummyRegion ]
    , showModal = False
    }


type alias Region =
    { topLeft : Point
    , topRight : Point
    , bottomLeft : Point
    , bottomRight : Point
    , label : String
    }


type alias Point =
    { x : Int, y : Int }


dummyRegion : Region
dummyRegion =
    { topLeft = { x = 0, y = 0 }
    , topRight = { x = 0, y = 1 }
    , bottomLeft = { x = 1, y = 0 }
    , bottomRight = { x = 1, y = 1 }
    , label = "dummyRegion"
    }
