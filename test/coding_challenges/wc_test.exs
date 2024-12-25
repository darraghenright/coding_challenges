defmodule CodingChallenges.WcTest do
  @moduledoc """
  Test suite for the wc command.
  https://codingchallenges.fyi/challenges/challenge-wc
  """
  use ExUnit.Case, async: true
  alias CodingChallenges.Wc
  import TestHelper

  test "test file test.txt should exist" do
    assert File.exists?(test_file())
  end

  describe "bytes!/1" do
    test "should return the number of bytes in the file" do
      assert Wc.bytes!(test_file()) == 342_190
    end

    test "should raise an error if the file does not exist" do
      assert_raise File.Error, fn ->
        Wc.bytes!("non_existent_file.txt")
      end
    end

    test "should raise an error if the file argument is not a binary" do
      assert_raise FunctionClauseError, fn ->
        Wc.bytes!(123)
      end
    end
  end

  describe "characters!/1" do
    test "should return the number of multibyte characters in the file" do
      assert Wc.characters!(test_file()) == 339_292
    end

    test "should raise an error if the file does not exist" do
      assert_raise File.Error, fn ->
        Wc.characters!("non_existent_file.txt")
      end
    end

    test "should raise an error if the file argument is not a binary" do
      assert_raise FunctionClauseError, fn ->
        Wc.characters!(123)
      end
    end
  end

  describe "lines!/1" do
    test "should return the number of lines in the file" do
      assert Wc.lines!(test_file()) == 7_145
    end

    test "should raise an error if the file does not exist" do
      assert_raise File.Error, fn ->
        Wc.lines!("non_existent_file.txt")
      end
    end

    test "should raise an error if the file argument is not a binary" do
      assert_raise FunctionClauseError, fn ->
        Wc.lines!(123)
      end
    end
  end

  describe "words!/1" do
    test "should return the number of words in the file" do
      assert Wc.words!(test_file()) == 58_164
    end

    test "should raise an error if the file does not exist" do
      assert_raise File.Error, fn ->
        Wc.words!("non_existent_file.txt")
      end
    end

    test "should raise an error if the file argument is not a binary" do
      assert_raise FunctionClauseError, fn ->
        Wc.words!(123)
      end
    end
  end
end
