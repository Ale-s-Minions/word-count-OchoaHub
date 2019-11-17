defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
      Regex.scan(~r/[[:alnum:]-]+/u, sentence) |>
    # alnum soporta letras y digitos
    # Regex soporta varios tipos de caracteres, como letras y digitos que es mi caso
    # Regex.scan escanea lo que hay dentro de regex varias veces
    Enum.reduce(%{}, fn [word], counts ->
        Map.update(counts, String.downcase(word), 1, &(&1 + 1))
    end)
  end
end
