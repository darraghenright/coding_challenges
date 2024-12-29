defmodule Mix.Tasks.Wc.WordsTest do
  @moduledoc """
  Command line tests for mix wc --words and -w alias.
  """
  use ExUnit.Case, async: true

  @test_file TestHelper.test_file()

  describe "wc --words/w" do
    test "should return words and path for a readable file" do
      {response, exit_status} = System.cmd("mix", ["wc", "--words", @test_file])

      assert response == "58164 #{@test_file}\n"
      assert exit_status == 0
    end

    test "should return words and path for a readable file with -w alias" do
      {response, exit_status} = System.cmd("mix", ["wc", "-w", @test_file])

      assert response == "58164 #{@test_file}\n"
      assert exit_status == 0
    end
  end
end
