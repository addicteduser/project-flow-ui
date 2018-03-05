# User Interface for ProjectFlow

### Development

##### Compile Elm code

-   Point to the `src/elm/` folder
-   Run `elm-make Main.elm --output=../js/elm.js` to generate `elm.js`

##### Custom JS

-   Add custom JS in `src/js/` folder
-   Import custom JS inside the `<body>` tag of `src/index.html`

_Note: Access `SOM Visualization Panel` via `id = "som-vis"`_

### Features

##### Configuration Panel

-   set settings for SOM
    -   epoch
    -   learning rate
    -   SOM size
    -   adding region
        -   user needs to select 4 points to make a rectangle
        -   label

##### Dataset Panel

-   upload dataset

##### Visualization Panel

-   display SOM

### Resources

-   [Elm](https://www.elm-lang.org/) is a functional language that compiles to JavaScript.
    -   See `src/elm-package.json` for list of dependencies used by Elm.
