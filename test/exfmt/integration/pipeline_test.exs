defmodule Exfmt.Integration.PipelineTest do
  use ExUnit.Case
  import Support.Integration

  describe "pipeline in anonymous functions" do
    test "short pipeline" do
      # Short, non-wrapping example
      """
      Task.start(fn -> apple |> eat end)
      """ ~> """
      Task.start fn -> apple |> eat end
      """
    end

    test "long pipeline" do
      # Long, wrapping example
      """
      Task.start(fn -> banana |> peel_banana |> slice_banana |> eat_banana end)
      """ ~> """
      Task.start fn ->
                   banana
                   |> peel_banana
                   |> slice_banana
                   |> eat_banana
                 end
      """
    end
  end
end
