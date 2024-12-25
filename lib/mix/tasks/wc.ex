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
          m: :chars,
          w: :words
        ],
        strict: [
          bytes: :boolean,
          chars: :boolean,
          lines: :boolean,
          words: :boolean
        ]
      )

    response =
      case opts do
        [bytes: true] -> Wc.bytes!(file)
        [chars: true] -> Wc.chars!(file)
        [lines: true] -> Wc.lines!(file)
        [words: true] -> Wc.words!(file)
        [] -> Enum.join([Wc.lines!(file), Wc.words!(file), Wc.bytes!(file)], " ")
      end

    IO.puts("#{response} #{file}")
  end
end
