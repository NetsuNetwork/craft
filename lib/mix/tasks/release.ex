defmodule Mix.Tasks.Craft.Release do
  @moduledoc """
  Mix task for pushing releases
  """

  use Mix.Task

  import Craft.Common

  def run(_) do
    IO.puts "Are you sure you want to release this tag?"

    if IO.gets("(Type 'yes' to confirm): ") |> String.downcase()  != "yes" do
      exit(:normal)
    end

    {output, exit_code} = System.cmd("git", ["add", "CHANGELOG.md"], into: IO.stream())

    if exit_code != 0 do
      raise "Git failed with a non-zero exit code\n\n#{output}"
    end

    {:ok, version} = current_version()
    {output, exit_code} = System.cmd("git", ["commit", "--no-verify", "--message", "release: #{version}"], into: IO.stream())

    if exit_code != 0 do
      raise "Git failed with a non-zero exit code\n\n#{output}"
    end
  end
end
