defmodule CodingChallenges.MixProject do
  @moduledoc false
  use Mix.Project

  def project do
    [
      app: :coding_challenges,
      deps: deps(),
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end
end
