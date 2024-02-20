# frozen_string_literal: true

require "test_helper"

class CreateEvolutionsServiceTest < ActiveSupport::TestCase
  setup do
    @chain_response = {chain: {species: {name: "squirtle"}, evolves_to: [species: {name: "wartortle"}, evolves_to: [species: {name: "blastoise"}]]}}.with_indifferent_access
    @mock = Minitest::Mock.new
    @mock.expect :process, Pokemon.create(name: "squirtle", pokedex_id: 7, weight: 90)
    @mock.expect :process, Pokemon.create(name: "wartortle", pokedex_id: 8, weight: 22)
    @mock.expect :process, Pokemon.create(name: "blastoise", pokedex_id: 9, weight: 85)
  end

  test "::for" do
    CreateOrUpdatePokemonWithAssociationsService.stub :new, @mock do
      pokemon_chain = CreateEvolutionsService.for(@chain_response)
      assert_equal 3, pokemon_chain.count
      assert_equal "wartortle", pokemon_chain.first.parent.name
      assert_equal "blastoise", pokemon_chain.second.parent.name
      assert_nil pokemon_chain.third.parent
    end

    assert_mock @mock
  end
end
