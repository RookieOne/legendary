defmodule Cards.Shield do
  alias Game.HeroCard

  def create(:shield_agent) do
    %HeroCard{
      name: "S.H.I.E.L.D. Agent",
      hero_name: "Hero",
      team_icon: :shield,
      recruit_points: 1
    }
  end

  def create(:shield_trooper) do
    %HeroCard{
      name: "S.H.I.E.L.D. Trooper",
      hero_name: "Hero",
      team_icon: :shield,
      attack: 1
    }
  end

  def create(:shield_officer) do
    %HeroCard{
      name: "S.H.I.E.L.D. Officer",
      hero_name: "Maria Hill",
      team_icon: :shield,
      recruit_points: 2,
      cost: 3
    }
  end

  def play("S.H.I.E.L.D. Agent", player) do
    %{player | recruit_points: player.recruit_points + 1}
  end
end
