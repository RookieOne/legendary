defmodule Game do
  alias Game.Board

  defstruct [
    board: %Board{},
    players: []
  ]
end
