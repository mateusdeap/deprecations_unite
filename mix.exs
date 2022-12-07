defmodule DeprecationsUnite.MixProject do
  use Mix.Project

  def project do
    [
      app: :deprecations_unite,
      version: "0.1.0",
      elixir: "~> 1.13",
      description: "A tool to merge deprecation lists in JSON format.",
      package: [
        name: "deprecations_unite",
        license: ["MIT"],
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 5.0.0"}
    ]
  end
end
