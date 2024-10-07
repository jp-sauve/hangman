defmodule Util do
  def swap({a, b}) do
    {b, a}
  end

  def sameparams({a, a}), do: true
  def sameparams({_a, _}) do
    false
  end

  def double([]), do: []
  def double([head  | tail]), do: [head*2 | double(tail)]

  def square([]), do: []
  def square([head  | tail]), do: [head*head | square(tail)]

  def list_len([]), do: 0
  def list_len([_head | tail]), do: 1 + list_len(tail)

  def list_sum([]), do: 0
  def list_sum([head | tail]), do: head + list_sum(tail)

  def sum_pairs([]), do: []
  def sum_pairs([head1, head2 | tail]), do: [head1 + head2 | sum_pairs(tail)]

  def even_length([]), do: true
  def even_length([_h1]), do: false
  def even_length([_h1,_h2|tail]), do: even_length(tail)

end
