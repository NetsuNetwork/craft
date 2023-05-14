defmodule Mix.Tasks.Craft.Bump do
  @moduledoc """
  Mix task for bumping the current Project version
  """
  use Mix.Task

  import Craft.Common

  def run(["major"]) do
    {:ok, version} = current_version()
    current = Version.parse!(version)

    new = current |> Map.merge(%{minor: current.major + 1}) |> to_string

    overwrite_file("mix.exs", version, new)
  end

  def run(["minor"]) do
    {:ok, version} = current_version()
    current = Version.parse!(version)

    new = current |> Map.merge(%{minor: current.minor + 1}) |> to_string

    overwrite_file("mix.exs", version, new)
  end

  def run(["patch"]) do
    {:ok, version} = current_version()
    current = Version.parse!(version)

    new = current |> Map.merge(%{patch: current.patch + 1}) |> to_string

    overwrite_file("mix.exs", version, new)
  end

  @shortdoc "Bumps the version of the current Mix project"
  def run(_), do: IO.puts("There's nothing to do...")
end
