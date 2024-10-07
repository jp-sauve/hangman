defmodule Dictionary do

  @word_list "assets/words.txt"
    |> File.read!()
    |> String.split()

  def random_word do
    @word_list
    |> Enum.random()
  end
end
