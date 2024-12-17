defmodule Dictionary.Impl.WordList do

  @type t :: list(String.t)

  @spec word_list() :: t
  def word_list do
    word_list("../../assets/words.txt")
  end

  @spec word_list(String.t) :: t
  def word_list(list) do
    list
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  @spec random_word(t) :: String.t
  def random_word(word_list) do
    word_list
    |> Enum.random()
  end
end
