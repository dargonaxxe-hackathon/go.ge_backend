defmodule GoGe.Core.MixProject do
  use Mix.Project

  def project do
    [
      app: :goge_core,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {GoGe.Core.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.10"},
      {:postgrex, "0.17.3"}
    ]
  end
end
