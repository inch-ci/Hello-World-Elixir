defmodule InchTest do
  defmodule Config do
    defstruct [
      output: "docs", source_root: nil, source_url: nil, source_url_pattern: nil,
      homepage_url: nil, source_beam: nil, retriever: InchEx.Docs.Retriever,
      formatter: InchEx.Docs.Formatter, project: nil, version: nil, main: nil,
      readme: false, formatter_opts: []
    ]
  end

  @doc false
  def generate_docs(project, version, args, options) when is_binary(project) and is_binary(version) and is_list(options) do
  end
end
