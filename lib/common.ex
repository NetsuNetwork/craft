defmodule Craft.Common do
  @spec current_version :: {:ok, String.t()} | {:error, String.t()}
  def current_version do
    case Mix.Project.get() do
      nil -> {:error, "Project does not contain a version"}
      _ -> {:ok, Mix.Project.config.get()[:version]}
    end
  end
end
