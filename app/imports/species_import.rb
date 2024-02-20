# frozen_string_literal: true

class SpeciesImport < ApplicationImport
  def import
    record.update!(attributes)
    record
  end

  private

  def attributes
    {description: response["flavor_text_entries"].find { |entrie|
                    entrie.dig("language",
                      "name") == "en"
                  }["flavor_text"]}
  end
end
