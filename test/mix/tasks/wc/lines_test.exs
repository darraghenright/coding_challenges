defmodule Mix.Tasks.Wc.LinesTest do
  @moduledoc """
  Command line tests for mix wc --lines and -l alias.
  """
  use ExUnit.Case, async: true

  @test_file TestHelper.test_file()

  describe "wc --lines/l" do
    test "should return lines and path for a readable file" do
      {response, exit_status} = System.cmd("mix", ["wc", "--lines", @test_file])

      assert response == "7145 #{@test_file}\n"
      assert exit_status == 0
    end

    test "should return lines and path for a readable file with -l alias" do
      {response, exit_status} = System.cmd("mix", ["wc", "-l", @test_file])

      assert response == "7145 #{@test_file}\n"
      assert exit_status == 0
    end
  end
end
