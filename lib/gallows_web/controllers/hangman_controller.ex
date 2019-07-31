defmodule GallowsWeb.HangmanController do
  use GallowsWeb, :controller

  alias Hangman
  alias Plug.Conn

  @spec new_game(Conn.t, any) :: Conn.t
  def new_game(conn, _params), do: render(conn, "new_game.html")

  @spec create_game(Conn.t, any) :: Conn.t
  def create_game(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)

    conn
    |> put_session(:game, game)
    |> render("game_field.html", tally: tally)
  end

  @spec make_move(Conn.t, any) :: Conn.t
  def make_move(conn, params) do
    guess = params["make_move"]["guess"]

    tally =
      conn
      |> get_session(:game)
      |> Hangman.make_move(guess)

    put_in(conn.params["make_move"]["guess"], "")
    |> render("game_field.html", tally: tally)
  end
end
