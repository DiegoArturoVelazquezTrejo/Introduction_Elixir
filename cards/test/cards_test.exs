defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  @doc """
    Prueba unitaria para ver el tamaño de un deck 
  """
  test "create_Deck makes 20 cards" do
    deck_length = length(Cards.create_Deck)
    assert deck_length == 40
  end
  @doc """
    Prueba unitaria para ver que onda con el shuffle
  """
  test "shuffling a deck rondomizes it" do
    deck = Cards.create_Deck
    refute deck == Cards.shuffle(deck)
  end
end
