module Helper exposing (..)

{-| Provides helper/utility functions.
-}

--
-- IMPORTS
--

import Model exposing (Point, Region, ValidationState(..))


{-| Checks if x is a positive integer that is greater than 0.

    isPositiveInteger x == True/False

-}
isPositiveInteger : Int -> Bool
isPositiveInteger x =
    if x > 0 then
        True
    else
        False


{-| Checks if x is a positive float that is greater than 0.

    isPositiveFloat x == True/False

-}
isPositiveFloat : Float -> Bool
isPositiveFloat x =
    if x > 0 then
        True
    else
        False


{-| Checks if the x- or y- coordinate is in the range [0, maxVal).

    isValidPointCoordinate xCoordinate row == True/False
    isValidPointCoordinate yCoordinate col == True/False
    isValidPointCoordinate 0 1 == True
    isValidPointCoordinate -1 1 == False
    isValidPointCoordinate 1 1 == False
    isValidPointCoordinate 2 1 == False

-}
isValidPointCoordinate : Int -> Int -> Bool
isValidPointCoordinate coordinate maxVal =
    if (0 <= coordinate) && (coordinate < maxVal) then
        True
    else
        False


{-| Converts strNum to an integer. Returns -1 if strNum cannot be converted into an integer.

    toInt "1" == 1
    toInt "1.0" == -1
    toInt "1.1" == -1

-}
toInt : String -> Int
toInt strNum =
    strNum |> String.toInt |> Result.toMaybe |> Maybe.withDefault -1


{-| Converts strNum to a float. Returns -1 if strNum cannot be converted into a float.

    toFloat "1" == 1
    toFloat "1.0" == 1
    toFloat ".1" == 0.1

-}
toFloat : String -> Float
toFloat strNum =
    strNum |> String.toFloat |> Result.toMaybe |> Maybe.withDefault -1


{-| Checks if the validationStates of the x- and y- coordinates are Valid.

    isPointValid point == True/False

-}
isPointValid : Point -> Bool
isPointValid point =
    if (point.xValidation == Valid) && (point.yValidation == Valid) then
        True
    else
        False


{-| Checks if the label already exists in the list of regions.

    doesRegionLabelExist label regions == True/False

-}
doesRegionLabelExist : String -> List Region -> Bool
doesRegionLabelExist label regions =
    let
        labels =
            List.map (\region -> region.label) regions
    in
    if List.member label labels then
        True
    else
        False


{-| Returns the (css, msg) for the user interface indicators based on the validationState.

    getUiValidation validationState invalidMsg == (css, msg)

-}
getUiValidation : ValidationState -> String -> ( String, String )
getUiValidation validationState invalidMsg =
    case validationState of
        Valid ->
            ( "", "" )

        Empty ->
            ( " is-invalid ", "" )

        Invalid ->
            ( " is-invalid ", invalidMsg )
