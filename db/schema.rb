# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_20_043920) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_abilities_on_name", unique: true
  end

  create_table "pokemon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "pokemon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "pokemon_desc_idx"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "pokedex_id"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.string "front_default_url"
    t.jsonb "pokemon_response"
    t.index ["name"], name: "index_pokemons_on_name", unique: true
    t.index ["pokedex_id"], name: "index_pokemons_on_pokedex_id", unique: true
  end

  create_table "pokemons_abilities", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "ability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id"], name: "index_pokemons_abilities_on_ability_id"
    t.index ["pokemon_id"], name: "index_pokemons_abilities_on_pokemon_id"
  end

  create_table "pokemons_types", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_pokemons_types_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemons_types_on_type_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "description"
    t.bigint "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "species_response"
    t.index ["pokemon_id"], name: "index_species_on_pokemon_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_types_on_name", unique: true
  end

end
