defmodule Mix.Tasks.Deprecations.Unite do
  @shortdoc "Merges deprecation list files given in `--path` option"

  use Mix.Task

  def run(args) do
    DeprecationsUnite.main(args)
  end
end