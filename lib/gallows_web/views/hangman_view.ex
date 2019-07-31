defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view

  import GallowsWeb.Views.Helpers.GameStateHelper

  @spec game_over?(%{game_state: any}) :: boolean
  def game_over?(%{game_state: state}), do: state in [:won, :lost]

  @spec new_game_button(Plug.Conn.t) :: {:safe, [String.t, ...]}
  def new_game_button(conn), do:
    button("New Game", to: Routes.hangman_path(conn, :create_game))

  @spec turn(pos_integer, integer) :: String.t
  def turn(left, target) when target >= left do
    "opacity: 1"
  end

  def turn(_left, _target), do: "opacity: 0.1"

  @spec show_letters([String.t]) :: String.t
  def show_letters(letters), do: Enum.join(letters, " ")
end
