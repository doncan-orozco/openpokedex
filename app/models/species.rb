# freeze_string_literal: true

class Species < ApplicationRecord
  belongs_to :pokemon

  validates :description, presence: true
end
