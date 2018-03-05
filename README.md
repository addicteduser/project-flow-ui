# User Interface for ProjectFlow

### Development

-   Run `elm-reactor`
-   Go to <http://localhost:8000>
-   Open `src/Main.elm`

### Deployment

-   Point to the `src/elm/` folder
-   Run `elm-make Main.elm --output=../js/elm.js` to generate `elm.js`

### Dependencies

-   [Elm](https://www.elm-lang.org/) is a functional language that compiles to JavaScript.
    -   See `src/elm-package.json` for list of dependencies used by Elm.

### TODO

Configuration Panel

-   set settings for SOM
    -   epoch
    -   learning rate
    -   SOM size
    -   adding region
        -   user needs to select 4 points to make a rectangle
        -   label

Dataset Panel

-   upload Dataset

Visualization Panel

-   display SOM
