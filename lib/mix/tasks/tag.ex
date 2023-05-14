defmodule Mix.Tasks.Craft.Tag do
  @moduledoc """
  Mix task for managing Git tags
  """

  use Mix.Task

  import Craft.Common

  def run(_) do
    version = current_version()
    {output, exit_code} = System.cmd("git", ["tag", "#{version}"], into: IO.stream())

    if exit_code != 0 do
      raise "Git failed with a non-zero exit code\n\n#{output}"
    end
  end
end
