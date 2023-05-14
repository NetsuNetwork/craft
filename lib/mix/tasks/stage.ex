defmodule Mix.Tasks.Craft.Stage do
  @moduledoc """
  Mix Task for staging CHANGELOG.md and mix.exs
  """
  use Mix.Task

  import Craft.Common

  def run(_) do
    log_and_execute("Staging CHANGELOG.md and mix.exs", fn _version, _current ->
      System.cmd("git", ["add", "CHANGELOG.md", "mix.exs"], into: IO.stream())
    end)
  end
end
