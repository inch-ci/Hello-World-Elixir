defmodule InchTest.CodeExamples do
  @doc """
  Extracts the resource name from an alias

  ## Examples

      iex> InchTest.Naming.resource_name(MyApp.User)
      "user"
      iex> InchTest.Naming.resource_name(MyApp.UserView, "View")
      "user"
  """
  def single_code_example do
  end

  @doc """
  Converts String to underscore case

  ## Examples

      iex> InchTest.Naming.underscore("MyApp")
      "my_app"

      iex> InchTest.Naming.underscore("my-app")
      "my_app"

  In general, `underscore` can be thought of as the reverse of
  `camelize`, however, in some cases formatting may be lost:

      Naming.underscore "SAPExample"  #=> "sap_example"
      Naming.camelize   "sap_example" #=> "SapExample"

  """
  def multiple_code_examples do
  end
end
