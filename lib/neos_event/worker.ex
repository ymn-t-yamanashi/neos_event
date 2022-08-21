defmodule NeosEvent.Worker do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call({:set, val}, _from, stack) do
    stack = stack ++ [val]
    {:reply, :ok, stack}
  end

  @impl true
  def handle_call({:get}, _from, stack) do
    {h, stack} = getval(stack)
    {:reply, h, stack}
  end

  def set(val) do
    GenServer.call(__MODULE__, {:set, val} )
  end

  def get() do
    GenServer.call(__MODULE__, {:get} )
  end

  defp getval([]), do: {[], []}
  defp getval([h | stack]), do: {h, stack}

end
