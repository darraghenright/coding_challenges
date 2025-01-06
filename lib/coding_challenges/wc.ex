defmodule CodingChallenges.Wc do
  @moduledoc """
  https://codingchallenges.fyi/challenges/challenge-wc
  """
  defguard is_io_device(device) when is_pid(device) or device == :stdio

  @doc """
  Count the number of bytes for a given file or device.
  """
  @spec bytes!(binary() | IO.device()) :: non_neg_integer()
  def bytes!(filepath) when is_binary(filepath) do
    with device <- File.open!(filepath, [:utf8]) do
      bytes!(device)
    end
  end

  def bytes!(device) when is_io_device(device) do
    device
    |> IO.stream(1_024 * 8)
    |> Enum.reduce(0, fn chunk, acc ->
      byte_size(chunk) + acc
    end)
  end

  @doc """
  Count the number of multibyte chars for a given file or device.
  """
  @spec chars!(binary() | IO.device()) :: non_neg_integer()
  def chars!(filepath) when is_binary(filepath) do
    with device <- File.open!(filepath, [:utf8]) do
      chars!(device)
    end
  end

  def chars!(device) when is_io_device(device) do
    device
    |> IO.stream(1_024 * 8)
    |> Enum.reduce(0, fn char, acc ->
      (char
       |> String.codepoints()
       |> length()) + acc
    end)
  end

  @doc """
  Count the number of lines in a given file or device.
  """
  @spec lines!(binary() | IO.device()) :: non_neg_integer()
  def lines!(filepath) when is_binary(filepath) do
    filepath
    |> File.stream!()
    |> Enum.count()
  end

  def lines!(device) when is_io_device(device) do
    device
    |> IO.stream(1_024 * 8)
    |> Enum.reduce(0, fn chunk, acc ->
      (~r/\n/
       |> Regex.scan(chunk)
       |> length()) + acc
    end)
  end

  @doc """
  Count the number of words in a given file or device.
  """
  @spec words!(binary() | IO.device()) :: non_neg_integer()
  def words!(filepath) when is_binary(filepath) do
    with device <- File.open!(filepath, [:utf8]) do
      words!(device)
    end
  end

  def words!(device) when is_io_device(device) do
    device
    |> IO.stream(:line)
    |> Stream.flat_map(&String.split/1)
    |> Enum.count()
  end
end
