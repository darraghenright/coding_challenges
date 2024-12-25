defmodule CodingChallenges.Wc do
  @moduledoc """
  https://codingchallenges.fyi/challenges/challenge-wc
  """

  @doc """
  Counts the number of bytes in a given file.
  Raises an error if the file does not exist.
  """
  @spec bytes!(binary()) :: non_neg_integer()
  def bytes!(file) when is_binary(file) do
    file
    |> File.stream!([], 1_024 * 8)
    |> Enum.reduce(0, fn chunk, acc ->
      byte_size(chunk) + acc
    end)
  end
end
