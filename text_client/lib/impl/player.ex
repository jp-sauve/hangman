defmodule TextClient.Impl.Player do

  @typep game :: Hangman.game
  @typep tally :: Hangman.tally
  @typep state :: { game, tally }

  @spec start() :: :ok
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  # @type state :: :initializing | :good_guess | :bad_guess | :already_used

  def interact({_game, tally = %{ game_state: :won } }) do
    IO.puts("Congrats! You won! The word was \"#{tally.letters |> Enum.join }\"")
  end

  def interact({_game, tally = %{ game_state: :lost } }) do
    IO.puts("Congrats! You lost! The word was #{tally.letters |> Enum.join }")
  end

  @spec interact({game, tally}) :: :ok
  def interact({ game, tally }) do
    # feedback
    IO.puts feedback_for(tally)
    # display current word
    IO.puts current_word(tally)
    # make move
    Hangman.make_move(game, get_guess())
    # rinse repeat
    |> interact()
  end

  def feedback_for(tally = %{ game_state: :initializing }) do
    "Welcome! I'm thinking of a #{tally.letters |> length} letter word"
  end

  def feedback_for(tally = %{ game_state: :good_guess }), do: "Good guess! #{(tally.letters |> Enum.filter(&(&1 == "_")) |> length)} letters left."
  def feedback_for(tally = %{ game_state: :bad_guess }), do: "Bad guess! Still #{(tally.letters |> Enum.filter(&(&1 == "_")) |> length)} letters left."
  def feedback_for(tally = %{ game_state: :already_used }), do: "C'mon, mate! You did that one already. Still #{(tally.letters |> Enum.filter(&(&1 == "_")) |> length)} letters left."

  def current_word(tally) do
    # ("Word so far: " <> (tally.letters |> Enum.join(" "))) |> IO.puts
    [
      "Word so far: ", tally.letters |> Enum.join(" "),
      "\n    turns left: ", tally.turns_left |> to_string,
      "\n    used so far: ", tally.used |> Enum.join(",")
    ] |> IO.puts
  end

  def get_guess() do
    IO.gets("Give me a guess: ")
    |> String.trim()
    |> String.downcase()
  end
end
