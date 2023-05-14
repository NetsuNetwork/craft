defmodule Mix.Tasks.Craft.Gen do
  @moduledoc """
  Mix tasks for generating a CHANGELOG.md file via Git-Cliff.
  """
  use Mix.Task

  @shortdoc "Generates a CHANGELOG.md file for the current tag"
  def run(_) do
    {output, exit_code} = System.cmd("git-cliff", ["--current", "--prepend", "CHANGELOG.md", "-u"])

    if exit_code != 0 do
      raise "Git Cliff failed with a non-zero exit code\n\n#{output}"
    end
  end
end
