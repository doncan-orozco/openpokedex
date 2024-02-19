# freeze_string_literal: true

class PokemonsAbility < ApplicationRecord
  belongs_to :pokemon
  belongs_to :ability
end
