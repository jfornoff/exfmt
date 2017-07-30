defmodule Exfmt.Integration.PipelineTest do
  use ExUnit.Case
  import Support.Integration

  test "pipeline in anonymous functions" do
    """
    Task.start(fn -> rp |> capture_samplers |> do_some_business |> StoreReportingPeriod.report! end)
    """ ~> """
    Task.start fn ->
                 rp
                 |> capture_samplers
                 |> do_some_business
                 |> StoreReportingPeriod.report!
               end
    """
  end
end
