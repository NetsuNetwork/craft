defmodule Craft.Common do
  @moduledoc """
  Common utilities used in Craft's Mix Tasks
  """
  @spec current_version() :: {:ok, String.t()} | {:error, String.t()}
  def current_version do
    case Mix.Project.get() do
      nil -> {:error, "Project does not contain a version"}
      _ -> {:ok, Mix.Project.config()[:version]}
    end
  end

  @spec overwrite_file(String.t(), String.t(), String.t()) :: :ok | Exception
  def overwrite_file(file, from, to) do
    new = File.read!(file) |> String.replace(from, to)

    File.write!(file, new)
  end
end
