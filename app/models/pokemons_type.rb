# freeze_string_literal: true

class PokemonsType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type
end
