# Gallows

HTTP interface for the Hangman game from the Dave Thomas (PragDave) course.

This app uses HTTP methods to communicate to Phoenix and then the Hangman app
(yes, this app uses Phoenix).

## Use

To launch it and play the game:

1. `mix phx.server`
2. connect to `localhost:4000/hangman`
3. enjoy!

**Note**: Chromium and Chrome have an issue where the hangman drawing doesn't show
up. To fix this, use a decent browser more spec compliant, like Firefox, which
will show the UI properly.
