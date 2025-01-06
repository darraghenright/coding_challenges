defmodule Mix.Tasks.Wc do
  @moduledoc """
  Mix task for the wc command.
  """
  use Mix.Task
  alias CodingChallenges.Wc
  require Logger

  @options [
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
  ]

  @shortdoc "..."
  @spec run(OptionParser.argv()) :: :ok
  def run(args) do
    case OptionParser.parse(args, @options) do
      {opts, [filepath], _errors} -> execute(filepath, opts)
      {opts, _argv, _errors} -> execute(:stdio, opts)
    end
  end

  defp execute(src, opts) do
    response =
      case opts do
        [bytes: true] -> Wc.bytes!(src)
        [chars: true] -> Wc.chars!(src)
        [lines: true] -> Wc.lines!(src)
        [words: true] -> Wc.words!(src)
        [] -> Enum.join([Wc.lines!(src), Wc.words!(src), Wc.bytes!(src)], " ")
      end

    if src == :stdio do
      IO.puts(response)
    else
      IO.puts("#{response} #{src}")
    end
  end
end
