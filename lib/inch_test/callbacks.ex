defmodule InchTest.Callbacks do
  use Behaviour

  @doc """
  Informs the given message.
  """
  defcallback full_doc(message :: IO.ANSI.ansidata) :: any

  @doc false
  defcallback no_doc(message :: IO.ANSI.ansidata) :: any

  defcallback missing_doc(message :: IO.ANSI.ansidata) :: any
end
