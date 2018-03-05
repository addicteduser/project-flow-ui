port module Ports exposing (..)

import Model exposing (Image)


-- FOR SENDING MESSAGES TO JS


port fileSelectedPort : String -> Cmd msg



-- FOR RECEIVING MESSAGES FROM JS


port fileContentRead : (Image -> msg) -> Sub msg
