defmodule Mix.Tasks.Wc.StdinTest do
  @moduledoc false
  use ExUnit.Case, async: true

  @test_file TestHelper.test_file()

  @scenarios [
    {"--bytes", 342_190},
    {"--chars", 339_292},
    {"--lines", 7_145},
    {"--words", 58_164}
  ]

  for {option, expected_result} <- @scenarios do
    @option option
    @expected_result expected_result

    describe "mix wc #{option}" do
      test "should read from stdin with input redirection" do
        {response, exit_status} = System.cmd("bash", ["-c", "mix wc #{@option} < #{@test_file}"])

        assert response == "#{@expected_result}\n"
        assert exit_status == 0
      end

      test "should read from stdin with piped input" do
        {response, exit_status} =
          System.cmd("bash", ["-c", "cat #{@test_file} | mix wc #{@option}"])

        assert response == "#{@expected_result}\n"
        assert exit_status == 0
      end
    end
  end
end
