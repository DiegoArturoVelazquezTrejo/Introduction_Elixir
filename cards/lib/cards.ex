defmodule Cards do
  @moduledoc """
    Documentation for `Cards`.

      Comandos importantes:

      Para recompilar se escribe
        recompile()
      Para generar la documentación en html se escribe:
        mix docs
      Para correr las pruebas unitarias se escribe:
        mix test
  """
  @doc """
      Solución 1 al metodo de create_Deck

      cards = for value <- values do
          for suit <- suits do
            lo que va adentro del for
          end
      end
      List.flatten(cards)
  """
  def create_Deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seve", "Eight", "Nine", "Ten"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end
  @doc """
    Función que randomiza el contenido de un arreglo
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Función que dice si una lista de cartas contiene una en particular

  ## Examples

      iex> deck = Cards.create_Deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end
  @doc """
    Función que regresa una mano partida de acuerdo a la cantidad de cartas
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  @doc """
    Guardar el deck, guardando data en archivos
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  @doc """
    Función que lee información de archivos de texto
  """
  def load(fileName) do
    {status, binary} = File.read(fileName)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end

  @doc """
  Función para crear la mano
  ## Examples
      iex> deck = Cards.create_Deck
      iex> deck = Cards.shuffle(deck)
      iex> deck = Cards.deal(deck, 10)

  """
  def create_hand(hand_size) do
    Cards.create_Deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
