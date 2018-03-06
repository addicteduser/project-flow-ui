port module Ports exposing (..)

import Model exposing (..)


-- FOR SENDING MESSAGES TO JS


port fileSelectedPort : () -> Cmd msg
