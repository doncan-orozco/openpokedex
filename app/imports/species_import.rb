# frozen_string_literal: true

class SpeciesImport < ApplicationImport
  def import
    record.update!(attributes)
    record
  rescue ActiveRecord::RecordInvalid => exception
    Rails.logger.error "[#{self.class}] #{exception.message}"
    record
  end

  private

  def attributes
    {description: description}
  end

  def description
    return "No description available" if response["flavor_text_entries"].empty?

    en_flavor_texts = response["flavor_text_entries"].find { |entry| entry.dig("language", "name") == "en" } || {}
    en_flavor_texts.dig("flavor_text") || response["flavor_text_entries"].first.dig("flavor_text")
  end
end
