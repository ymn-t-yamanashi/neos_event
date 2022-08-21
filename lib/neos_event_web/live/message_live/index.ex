defmodule NeosEventWeb.MessageLive.Index do
  use NeosEventWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :messages, [])}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end


  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Messages")
    |> assign(:message, nil)
  end

  @impl true
  def handle_event("launch", %{"id" => id}, socket) do
    IO.inspect(id)
    {:noreply, socket}
  end

end
