defmodule NeosEvent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NeosEventWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: NeosEvent.PubSub},
      # Start the Endpoint (http/https)
      NeosEventWeb.Endpoint,
      {NeosEvent.Worker, []}
      # Start a worker by calling: NeosEvent.Worker.start_link(arg)
      # {NeosEvent.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NeosEvent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NeosEventWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
