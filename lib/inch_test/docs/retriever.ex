# NOTE: the following code is "borrowed" from InchEx
# for testing purposes
# Original code adapted from ExDoc

defmodule InchTest.ModuleObject do
  defstruct id: nil, module: nil, moduledoc: nil,
    docs: [], typespecs: [], source: nil, type: nil
end

defmodule InchTest.FunctionObject do
  defstruct id: nil, name: nil, arity: 0, doc: [],
    source: nil, type: nil, signature: nil, specs: []
end

defmodule InchTest.TypeObject do
  defstruct id: nil, name: nil, arity: 0, type: nil,
    spec: nil, doc: nil
end

defmodule InchTest.Docs.Retriever.Error do
  defexception [:message]
end

defmodule InchTest.Docs.Retriever do
  @moduledoc """
  Functions to extract documentation information from modules.
  """

  @doc """
  Extract documentation from all modules in the specified directory
  """
  def docs_from_dir(dir, config) do
  end

  @doc """
  Extract documentation from all modules in the specified list of files
  """
  def docs_from_files(files, config) when is_list(files) do
  end

  @doc """
  Extract documentation from all modules in the list `modules`
  """
  def docs_from_modules(modules, config) when is_list(modules) do
  end
end
