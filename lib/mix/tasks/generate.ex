defmodule Mix.Tasks.Craft.Gen do
  @moduledoc """
  Mix task for generating a CHANGELOG.md file via Git-Cliff.
  """
  use Mix.Task

  import Craft.Common

  @shortdoc "Generates a CHANGELOG.md file for the current tag"
  def run(_) do
    {:ok, version} = current_version()
    {output, exit_code} = System.cmd("git-cliff", ["--tag", "#{version}", "--prepend", "./CHANGELOG.md", "-u"])

    if exit_code != 0 do
      raise "Git Cliff failed with a non-zero exit code\n\n#{output}"
    end
  end
end
