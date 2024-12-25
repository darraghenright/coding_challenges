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

  @doc """
  Counts the number of multibyte chars in a given
  file. Raises an error if the file does not exist.
  """
  @spec chars!(binary()) :: non_neg_integer()
  def chars!(file) when is_binary(file) do
    file
    |> File.stream!([], 1_024 * 8)
    |> Enum.reduce(0, fn char, acc ->
      (char
       |> String.codepoints()
       |> length()) + acc
    end)
  end

  @doc """
  Counts the number of lines in a given file.
  Raises an error if the file does not exist.
  """
  @spec lines!(binary()) :: non_neg_integer()
  def lines!(file) when is_binary(file) do
    file
    |> File.stream!()
    |> Enum.count()
  end

  @doc """
  Counts the number of words in a given file.
  Raises an error if the file does not exist.
  """
  @spec words!(binary()) :: non_neg_integer()
  def words!(file) when is_binary(file) do
    file
    |> File.stream!()
    |> Enum.flat_map(&String.split/1)
    |> Enum.count()
  end
end
