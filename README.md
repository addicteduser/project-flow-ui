# User Interface for [ProjectFlow](https://github.com/VilsonLu/MSThesis)

### Development

##### Compile Elm code

-   Point to the `src/elm/` folder
-   Run `elm-make Main.elm --output=../js/elm.js` to generate `elm.js`

##### Custom JS

-   Add custom JS in `src/js/` folder
-   Import custom JS inside the `<body>` tag of `src/index.html`

_Note: Access `SOM Visualization Panel` via `id = "som-vis"`_

### To-do

-   [ ] Send configuration input via HTTP request
-   [ ] Send dataset input via HTTP request
-   [ ] Display SOM

### Features

##### Configuration Panel

For setting the configuration for SOM training.

-   Epoch
-   Learning rate
-   SOM size
-   Region

##### Dataset Panel

For choosing which dataset to use.

##### Visualization Panel

For displaying the SOM.

### Resources

-   [Elm](https://www.elm-lang.org/) is a functional language that compiles to JavaScript.
    -   See `src/elm/elm-package.json` for list of dependencies used by Elm.
