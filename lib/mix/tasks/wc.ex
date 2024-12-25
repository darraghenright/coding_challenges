defmodule Mix.Tasks.Wc do
  @moduledoc """
  Mix task for the wc command.
  """
  use Mix.Task
  alias CodingChallenges.Wc

  @shortdoc "..."
  def run(args) do
    parsed_options =
      OptionParser.parse(args,
        aliases: [c: :bytes],
        strict: [bytes: :boolean]
      )

    with {[bytes: true], [file], _} <- parsed_options do
      bytes = Wc.bytes!(file)
      IO.puts("#{bytes} #{file}")
    end
  end
end
