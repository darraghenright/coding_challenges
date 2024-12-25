defmodule Mix.Tasks.Wc do
  @moduledoc """
  Mix task for the wc command.
  """
  use Mix.Task
  alias CodingChallenges.Wc
  require Logger

  @shortdoc "..."
  @spec run(OptionParser.argv()) :: :ok
  def run(args) do
    {opts, [file], _errors} =
      OptionParser.parse(args,
        aliases: [
          c: :bytes,
          l: :lines,
          m: :characters,
          w: :words
        ],
        strict: [
          bytes: :boolean,
          characters: :boolean,
          lines: :boolean,
          words: :boolean
        ]
      )

    response =
      case opts do
        [lines: true] -> Wc.lines!(file)
        [bytes: true] -> Wc.bytes!(file)
        [characters: true] -> Wc.characters!(file)
        [words: true] -> Wc.words!(file)
      end

    IO.puts("#{response} #{file}")
  end
end
