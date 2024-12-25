defmodule Mix.Tasks.WcTest do
  @moduledoc false

  use ExUnit.Case, async: true
  alias Mix.Tasks.Wc
  import TestHelper
  import ExUnit.CaptureIO

  describe "wc --bytes" do
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

    test "missing file arg should be a no-op for now" do
      response =
        capture_io(fn ->
          Wc.run(["--bytes"])
        end)

      assert response == ""
    end
  end
end