defmodule Example.Mixfile do
  use Mix.Project

  def project do
    [app: :example,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: applications()]
  end

  def applications() do
    ~w(
      httpoison
      logger
     )a
  end

  defp deps do
    [
      {:ecto,      "2.1.0"},
      {:httpoison, "0.10.0"},
      {:poison,    "3.0.0"}
    ]
  end
end
