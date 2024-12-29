defmodule Mix.Tasks.Wc.BytesTest do
  @moduledoc """
  Command line tests for mix wc --bytes and -c alias.
  """
  use ExUnit.Case, async: true

  @test_file TestHelper.test_file()

  describe "mix wc --bytes/c" do
    test "should return bytes and path for a readable file" do
      {response, exit_status} = System.cmd("mix", ["wc", "--bytes", @test_file])

      assert response == "342190 #{@test_file}\n"
      assert exit_status == 0
    end

    test "should return bytes and path for a readable file with -c alias" do
      {response, exit_status} = System.cmd("mix", ["wc", "-c", @test_file])

      assert response == "342190 #{@test_file}\n"
      assert exit_status == 0
    end
  end
end
