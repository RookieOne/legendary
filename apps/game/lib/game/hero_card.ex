defmodule Game.HeroCard do
  defstruct [
    name: "",
    hero_name: "",
    team_icon: nil,
    hero_type: nil,
    recruit_points: 0,
    attack: 0,
    cost: 0,
    special_ability: nil
  ]

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
end
