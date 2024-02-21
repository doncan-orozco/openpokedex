# OpenPokedex Rails App

Welcome to the **OpenPokedex Rails App**! This web application allows users to explore information about their favorite Pokémon using data from the [PokeAPI](https://pokeapi.co/).

## Features

- **Pokédex Search**: Users can search for Pokémon by name or Pokédex number. (Coming soon!)
- **Detailed Pokémon Information**: View comprehensive details about each Pokémon, including their type, abilities, base stats, and evolutions.
- **Beautiful Pokémon Artwork**: High-quality official artwork of Pokémon is displayed.
- **User-Friendly Interface**: The app provides an intuitive and responsive user interface.

## Getting Started

1. **Clone the Repository**:
   ```
   git clone https://github.com/your-username/pokeapi-rails-app.git
   ```

2. **Install Dependencies**:
   ```
   bundle install
   ```

5. **Database Setup**:
   ```
   rails db:setup
   ```

5. **Start the Server**:
   ```
   bin/dev
   ```

6. **Access the App**:
   Open your web browser and navigate to `http://localhost:3000`.


## Fetch data
You can fetch all pokemon data easly

   ```
   rake pokemon_migration:fetch_all_pokemons
   ```

Or just seed the DB with a few examples

   ```
   rails db:seed
   ```

## Contributing

Contributions are welcome! If you find any issues or have ideas for improvements, feel free to submit a pull request.

## Credits

- [PokeAPI](https://pokeapi.co/) - The amazing Pokémon data source.
- Pokémon images provided by [PokeAPI Sprites](https://github.com/PokeAPI/sprites).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
