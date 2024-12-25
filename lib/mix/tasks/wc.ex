defmodule Mix.Tasks.Wc do
  @moduledoc """
  Mix task for the wc command.
  """
  use Mix.Task
  alias CodingChallenges.Wc
  require Logger

  @shortdoc "..."
  def run(args) do
    {opts, [file], _errors} =
      OptionParser.parse(args,
        aliases: [c: :bytes, l: :lines],
        strict: [bytes: :boolean, lines: :boolean]
      )

    response =
      case opts do
        [bytes: true] -> Wc.bytes!(file)
        [lines: true] -> Wc.lines!(file)
      end

    IO.puts("#{response} #{file}")
  end
end
