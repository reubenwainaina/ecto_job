defmodule EctoJob.Mixfile do
  use Mix.Project

  @version "0.1.1"
  @url "https://github.com/mbuhot/ecto_job"

  def project do
    [
      app: :ecto_job,
      description: "A transactional job queue built with Ecto, PostgreSQL and GenStage.",
      version: @version,
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Mike Buhot (m.buhot@gmail.com)"],
      links: %{
        "Github" => @url
      }
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:mix],
      plt_add_deps: :apps_direct,
      flags: ["-Werror_handling", "-Wno_unused", "-Wunmatched_returns", "-Wunderspecs"],
      remove_defaults: [:unknown]
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      source_ref: "v#{@version}",
      source_url: @url,
      homepage_url: @url
    ]
  end

  defp deps do
    [
      {:ecto, "~> 2.2"},
      {:postgrex, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:gen_stage, "~> 0.13"},
      {:credo, "~> 0.8", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:ex_doc, "~> 0.12", only: :dev, runtime: false},
      {:inch_ex, ">= 0.4.0", only: :dev, runtime: false}
    ]
  end
end