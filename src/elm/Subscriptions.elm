module Subscriptions exposing (subscriptions)

{-| Provides handler for mapping external input to Msg.
-}

--
-- IMPORTS
--

import Model exposing (Model, Msg)


{-| Maps external input to a Msg.

    subscriptions model == Sub msg

-}
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
