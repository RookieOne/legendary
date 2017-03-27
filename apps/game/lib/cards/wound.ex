defmodule Game.Cards.Wound do
  alias Game.HeroCard

  def create() do
    %HeroCard{
      id: UUID.uuid4(),
      name: "Wound",
      hero_name: "Wound"
    }
  end
end
