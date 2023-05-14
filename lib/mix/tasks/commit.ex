defmodule Mix.Tasks.Craft.Tag do
  @moduledoc """
  Mix task for pushing releases
  """

  use Mix.Task


  def run(["release", x]) do
    # current_version =
    {output, exit_code} = System.cmd("git", ["--no-verify", "--message", x, "--dry-run"])

    if exit_code != 0 do
      raise "Git failed with a non-zero exit code\n\n#{output}"
    end
  end

  @shortdoc "Task for pushing releases"
  def run(_), do: IO.puts "Nothing to do..."
end
