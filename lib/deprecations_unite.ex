defmodule DeprecationsUnite do
  @moduledoc """
  The one module to rule them all.
  """

  def main(args) do
    {valid_args, invalid_args, _} =
      args
      |> OptionParser.parse(strict: [path: :string])

    case invalid_args do
      [] ->
        file_names = Keyword.get(valid_args, :path) |> Path.wildcard()
        DeprecationsUnite.merge(file_names)

      _ ->
        IO.puts("Invalid argument")
    end
  end

  @doc """
  There is only one way to use this program:

  ```bash
  $ deprecations_unite --path [PATH_TO_DEPRECATION_LISTS]
  ```

  The path should be a string literal and it will accept globbing. I guess that is the only way this works, currently:

  ```bash
  $ deprecations_unite --path "lib/deprecations*.json"
  ```

  This will generate a file named `deprecations.json` in your current working directory.
  """
  def merge([]), do: IO.puts("No files found")

  def merge(file_names) do
    deprecations =
      Enum.map(file_names, fn path -> read_file(path) end)
      |> Enum.map(fn json_string -> Poison.decode!(json_string) end)
      |> Enum.reduce(fn deprecation_map, all_deprecations_map ->
        Map.merge(all_deprecations_map, deprecation_map)
      end)
      |> Poison.encode!(pretty: true)

    File.write("deprecations.json", deprecations)
  end

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} -> contents
      {:error, _} -> "{\n  \"message\": \"Unable to read file\"\n}"
    end
  end
end
