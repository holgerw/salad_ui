defmodule ComponentCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  setup_all do
    SaladUI.Cache.start_link([])
    :ok
  end

  setup do
    # This will run before each test that uses this case
    :ok
  end

  using do
    quote do
      import Phoenix.Component
      import Phoenix.LiveViewTest
      import Plug.HTML, only: [html_escape: 1]

      defp count_substring(string, substring) do
        string
        |> String.split(substring)
        |> Enum.count()
        |> Kernel.-(1)
      end

      def clean_string(str) do
        str
        |> String.replace("\n", "")
        |> String.replace("\r", "")
        |> String.replace("  ", "")
      end
    end
  end
end
