module Main exposing (..)

import Html
import Model exposing (model)
import Update exposing (update)
import View exposing (view)


main =
    Html.beginnerProgram { model = model, view = view, update = update }
