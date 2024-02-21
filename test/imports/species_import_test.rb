# frozen_string_literal: true

require "test_helper"

class SpeciesImportTest < ActiveSupport::TestCase
  test "::call" do
    pokemon = Pokemon.new
    species = Species.new(pokemon: pokemon)
    species_response = {flavor_text_entries: [{flavor_text: "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.", language: {name: "en"}}], genera: [{genus: "Seed"}]}

    SpeciesImport.call(species, species_response)
    assert_equal species_response[:flavor_text_entries].first[:flavor_text], species.description
  end
end
