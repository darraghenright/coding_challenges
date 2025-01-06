ExUnit.start()

defmodule TestHelper do
  @moduledoc false

  def test_file do
    Path.join([__DIR__, "test.txt"])
  end
end
