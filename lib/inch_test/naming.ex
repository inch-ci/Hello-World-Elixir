# NOTE: the following code is "borrowed" from the Phoenix web framework
# for testing purposes
defmodule InchTest.Naming do
  @doc """
  Extracts the resource name from an alias

  ## Examples

      iex> InchTest.Naming.resource_name(MyApp.User)
      "user"
      iex> InchTest.Naming.resource_name(MyApp.UserView, "View")
      "user"

  """
  def resource_name(alias, suffix \\ nil) do
    alias
    |> Module.split()
    |> List.last()
    |> remove_suffix(suffix)
    |> InchTest.Naming.underscore()
  end

  def remove_suffix(alias, nil),
    do: alias
  def remove_suffix(alias, suffix) do
    suffix_size = byte_size(suffix)
    prefix_size = byte_size(alias) - suffix_size
    case alias do
      <<prefix::binary-size(prefix_size), ^suffix::binary>> -> prefix
      _ -> alias
    end
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
  def underscore(""), do: ""

  def underscore(<<h, t :: binary>>) do
    <<to_lower_char(h)>> <> do_underscore(t, h)
  end

  def do_underscore(<<h, t, rest :: binary>>, _) when h in ?A..?Z and not t in ?A..?Z do
    <<?_, to_lower_char(h), t>> <> do_underscore(rest, t)
  end

  def do_underscore(<<h, t :: binary>>, prev) when h in ?A..?Z and not prev in ?A..?Z do
    <<?_, to_lower_char(h)>> <> do_underscore(t, h)
  end

  def do_underscore(<<?-, t :: binary>>, _) do
    <<?_>> <> do_underscore(t, ?-)
  end

  def do_underscore(<< "..", t :: binary>>, _) do
    <<"..">> <> underscore(t)
  end

  def do_underscore(<<?.>>, _), do: <<?.>>

  def do_underscore(<<?., t :: binary>>, _) do
    <<?/>> <> underscore(t)
  end

  def do_underscore(<<h, t :: binary>>, _) do
    <<to_lower_char(h)>> <> do_underscore(t, h)
  end

  def do_underscore(<<>>, _) do
    <<>>
  end

  def to_lower_char(char) when char in ?A..?Z, do: char + 32
  def to_lower_char(char), do: char

  @doc """
  Converts String to camel case

  ## Examples

      iex> InchTest.Naming.camelize("my_app")
      "MyApp"

  In general, `camelize` can be thought of as the reverse of
  `underscore`, however, in some cases formatting may be lost:

      InchTest.Naming.underscore "SAPExample"  #=> "sap_example"
      InchTest.Naming.camelize   "sap_example" #=> "SapExample"

  """
  def camelize(""), do: ""

  def camelize(<<?_, t :: binary>>) do
    camelize(t)
  end

  def camelize(<<h, t :: binary>>) do
    <<to_upper_char(h)>> <> do_camelize(t)
  end

  def do_camelize(<<?_, ?_, t :: binary>>) do
    do_camelize(<< ?_, t :: binary >>)
  end

  def do_camelize(<<?_, h, t :: binary>>) when h in ?a..?z do
    <<to_upper_char(h)>> <> do_camelize(t)
  end

  def do_camelize(<<?_>>) do
    <<>>
  end

  def do_camelize(<<?/, t :: binary>>) do
    <<?.>> <> camelize(t)
  end

  def do_camelize(<<h, t :: binary>>) do
    <<h>> <> do_camelize(t)
  end

  def do_camelize(<<>>) do
    <<>>
  end

  def to_upper_char(char) when char in ?a..?z, do: char - 32
  def to_upper_char(char), do: char
end
