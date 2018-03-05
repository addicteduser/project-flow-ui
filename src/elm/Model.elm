module Model exposing (..)


type Msg
    = FileSelected
    | ImageRead Image


type alias Image =
    { contents : String
    , filename : String
    }


model =
    0
