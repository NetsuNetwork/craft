defmodule Mix.Tasks.Craft.Bump do
  @moduledoc """
  Mix task for bumping the current Project version
  """
  use Mix.Task

  import Craft.Common

  def run(["major"]) do
    log_and_execute("Bumping: Major", fn version, current ->
      new = current |> Map.merge(%{major: current.major + 1}) |> to_string

      overwrite_file("mix.exs", version, new)
    end)
  end

  def run(["minor"]) do
    log_and_execute("Bumping: Minor", fn version, current ->
      new = current |> Map.merge(%{minor: current.minor + 1}) |> to_string

      overwrite_file("mix.exs", version, new)
    end)
  end

  def run(["patch"]) do
    log_and_execute("Bumping: Patch", fn version, current ->
      new = current |> Map.merge(%{patch: current.patch + 1}) |> to_string

      overwrite_file("mix.exs", version, new)
    end)
  end

  @shortdoc "Bumps the version of the current Mix project"
  def run(_), do: IO.puts("There's nothing to do...")
end
