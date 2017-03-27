defmodule Game.Test.Cards.ShieldTest do
  use ExUnit.Case

  alias Game.Player
  alias Game.Cards.Shield

  test "playing a shield trooper should increase attack" do
    player = %Player{}

    player = Shield.play("S.H.I.E.L.D. Trooper", player)

    assert player.attack == 1
  end

  test "playing a shield agent should increase recruit points" do
    player = %Player{}

    player = Shield.play("S.H.I.E.L.D. Agent", player)

    assert player.recruit_points == 1
  end

  test "playing a shield officer should increase recruit points" do
    player = %Player{}

    player = Shield.play("S.H.I.E.L.D. Officer", player)

    assert player.recruit_points == 2
  end
end
