defmodule InchTest.Functions do
  @moduledoc """
    In this module we define funs that are "cases" for our test suite.
  """

  @doc """
  This fun takes `param1` and `param2` as arguments.

  ## Examples

      iex> InchTest.Naming.resource_name(MyApp.User)
      "user"
      iex> InchTest.Naming.resource_name(MyApp.UserView, "View")
      "user"
  """
  def full_doc(param1, param2) do
  end

  @doc """
  This fun takes a `param1` and a second parameter that is never used
  (maybe, because it is a callback or something like that). However, the
  second param should impact the evaluation by Inch.

  ## Examples

      iex> InchTest.Naming.resource_name(MyApp.User)
      "user"
      iex> InchTest.Naming.resource_name(MyApp.UserView, "View")
      "user"
  """
  def full_doc_second_parameter_unnamed(param1, _) do
  end

end
