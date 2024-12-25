defmodule Mix.Tasks.WcTest do
  @moduledoc false

  use ExUnit.Case, async: true
  alias Mix.Tasks.Wc
  import TestHelper
  import ExUnit.CaptureIO

  describe "wc with no options" do
    test "should return lines, words and bytes for a readable file" do
      response =
        capture_io(fn ->
          Wc.run([test_file()])
        end)

      assert response == "7145 58164 342190 #{test_file()}\n"
    end
  end

  describe "wc --bytes/c" do
    test "should return bytes and path for a readable file" do
      response =
        capture_io(fn ->
          Wc.run(["--bytes", test_file()])
        end)

      assert response == "342190 #{test_file()}\n"
    end

    test "should return bytes and path for a readable file with -c alias" do
      response =
        capture_io(fn ->
          Wc.run(["-c", test_file()])
        end)

      assert response == "342190 #{test_file()}\n"
    end
  end

  describe "wc --chars/m" do
    test "should return multibyte chars and path for a readable file" do
      response =
        capture_io(fn ->
          Wc.run(["--chars", test_file()])
        end)

      assert response == "339292 #{test_file()}\n"
    end
  end

  describe "wc --lines/l" do
    test "should return lines and path for a readable file" do
      response =
        capture_io(fn ->
          Wc.run(["--lines", test_file()])
        end)

      assert response == "7145 #{test_file()}\n"
    end

    test "should return lines and path for a readable file with -l alias" do
      response =
        capture_io(fn ->
          Wc.run(["-c", test_file()])
        end)

      assert response == "342190 #{test_file()}\n"
    end
  end

  describe "wc --words/w" do
    test "should return words and path for a readable file" do
      response =
        capture_io(fn ->
          Wc.run(["--words", test_file()])
        end)

      assert response == "58164 #{test_file()}\n"
    end

    test "should return words and path for a readable file with -w alias" do
      response =
        capture_io(fn ->
          Wc.run(["-w", test_file()])
        end)

      assert response == "58164 #{test_file()}\n"
    end
  end
end
