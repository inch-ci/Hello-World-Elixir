defmodule InchTest.Macros do
  @doc "Another example"
  defmacro full_doc, do: 1

  @doc false
  defmacro no_doc, do: 1

  defmacro missing_doc, do: 1
end
