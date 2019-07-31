defmodule GallowsWeb.Views.Helpers.GameStateHelper do

  import Phoenix.HTML, only: [raw: 1]

  @responses %{
    :won          => {:success, "You Won!"},
    :lost         => {:danger, "You Lost!"},
    :good_guess   => {:success, "Good guess!"},
    :bad_guess    => {:warning, "Bad guess!"},
    :already_used => {:info, "You already used that letter."}
  }

  @spec game_state(atom) :: {:safe, String.t}
  def game_state(state), do: alert(@responses[state])

  defp alert(nil), do: raw("")

  defp alert({class, message}) do
    raw(
      """
      <div class="alert alert-#{class}">
        #{message}
      </div>
      """
    )
  end
end
