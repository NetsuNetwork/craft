defmodule Mix.Tasks.Craft.Release do
  @moduledoc """
  Mix task for pushing releases
  """

  use Mix.Task

  import Craft.Common

  def run(_) do
    {:ok, version} = current_version()
    {output, exit_code} = System.cmd("git", ["commit", "--no-verify", "--message", "release: #{version}"], into: IO.stream())

    if exit_code != 0 do
      raise "Git failed with a non-zero exit code\n\n#{output}"
    end
  end
end
