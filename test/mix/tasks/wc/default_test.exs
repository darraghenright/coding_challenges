defmodule Mix.Tasks.Wc.DefaultTest do
  @moduledoc """
  Command line tests for mix wc with no options.
  """
  use ExUnit.Case, async: true

  @test_file TestHelper.test_file()

  describe "wc with no options" do
    test "should return lines, words and bytes for a readable file" do
      {response, exit_status} = System.cmd("mix", ["wc", @test_file])

      assert response == "7145 58164 342190 #{@test_file}\n"
      assert exit_status == 0
    end
  end
end
