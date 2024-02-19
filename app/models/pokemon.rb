# freeze_string_literal: true

class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :pokedex_id, presence: true, uniqueness: true
  validates :weight, presence: true
end
