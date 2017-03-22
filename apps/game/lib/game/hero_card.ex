defmodule Game.HeroCard do
  defstruct [
    id: UUID.uuid4(),
    name: "",
    hero_name: "",
    team_icon: nil,
    hero_type: nil,
    recruit_points: 0,
    attack: 0,
    cost: 0,
    special_ability: nil
  ]
end
