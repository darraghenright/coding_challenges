defmodule Mix.Tasks.Wc.CharsTest do
  @moduledoc """
  Command line tests for mix wc --chars and -m alias.
  """
  use ExUnit.Case, async: true

  @test_file TestHelper.test_file()

  describe "mix wc --chars/m" do
    test "should return multibyte chars and path for a readable file" do
      {response, exit_status} = System.cmd("mix", ["wc", "--chars", @test_file])

      assert response == "339292 #{@test_file}\n"
      assert exit_status == 0
    end

    test "should return multibyte chars and path for a readable file with -m alias" do
      {response, exit_status} = System.cmd("mix", ["wc", "-m", @test_file])

      assert response == "339292 #{@test_file}\n"
      assert exit_status == 0
    end
  end
end
