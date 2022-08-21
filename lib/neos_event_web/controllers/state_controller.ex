defmodule NeosEventWeb.StateController do
  use NeosEventWeb, :controller

  def state(conn, _) do
    render(conn, "state.txt", val: NeosEvent.Worker.get())
  end
end
