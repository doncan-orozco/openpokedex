# frozen_string_literal: true

class SpeciesImport < ApplicationImport
  def import
    record.update!(attributes)
    record
  end

  private

  def attributes
    {description: description,
     species_response: response}
  end

  def description
    response["flavor_text_entries"].find { |entry|
      entry.dig("language",
        "name") == "en"
    }["flavor_text"]
  end
end
