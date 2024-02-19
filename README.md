# OpenPokeDex Rails App

Welcome to the **OpenPokeDex Rails App**! This web application allows users to explore information about their favorite Pokémon using data from the [PokeAPI](https://pokeapi.co/).

## Features

- **Pokédex Search**: Users can search for Pokémon by name or Pokédex number.
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

3. **Configure API Credentials**:
   - Create an account on [PokeAPI](https://pokeapi.co/).
   - Obtain your API key.
   - Add your API key to the `config/application.yml` file (create this file if it doesn't exist).

4. **Database Setup**:
   ```
   rails db:migrate
   ```

5. **Start the Server**:
   ```
   rails server
   ```

6. **Access the App**:
   Open your web browser and navigate to `http://localhost:3000`.

## Contributing

Contributions are welcome! If you find any issues or have ideas for improvements, feel free to submit a pull request.

## Credits

- [PokeAPI](https://pokeapi.co/) - The amazing Pokémon data source.
- Pokémon images provided by [PokeAPI Sprites](https://github.com/PokeAPI/sprites).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
