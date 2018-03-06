module Helper exposing (..)

import Model exposing (..)


isPositiveInteger : Int -> Bool
isPositiveInteger x =
    if x > 0 then
        True
    else
        False


isPositiveFloat : Float -> Bool
isPositiveFloat x =
    if x > 0 then
        True
    else
        False


isValidPointCoordinate : Int -> Int -> Bool
isValidPointCoordinate coordinate maxVal =
    if (0 <= coordinate) && (coordinate < maxVal) then
        True
    else
        False


toInt : String -> Int
toInt strNum =
    strNum |> String.toInt |> Result.toMaybe |> Maybe.withDefault 0


toFloat : String -> Float
toFloat strNum =
    strNum |> String.toFloat |> Result.toMaybe |> Maybe.withDefault 0


isPointValid : Point -> Bool
isPointValid point =
    if (point.xValidation == Valid) && (point.yValidation == Valid) then
        True
    else
        False
