port module Ports exposing (..)

{-| Provides ports for communicating to src/js/app.js.
-}


{-| Flag to indicate that a file has been selected.
-}
port fileSelectedPort : () -> Cmd msg
