defmodule NeosEventWeb.StateView do
  use NeosEventWeb, :view

  def render("state.txt", %{val: val}) do
    val
  end
end
