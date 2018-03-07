module Main exposing (main)

{-| Provides the entry point of the application.
-}

--
-- IMPORTS
--

import Html
import Model exposing (Model, Msg, model)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)


--
-- MAIN
--


{-| The entrty point of the application.
-}
main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


{-| The initial state of the application.
-}
init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )
