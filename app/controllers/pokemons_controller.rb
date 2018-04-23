class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def upload
    csv_path = File.join Rails.root, 'db', 'pokemon.csv'
    PokemonAddWorker.perform_async(csv_path)
    flash[:notice] = "Pokemons are being added to the database."
    redirect_to pokemons_path
  end

  def destroy_all
    PokemonRemoveWorker.perform_async
    flash[:notice] = "Pokemons are getting removed from the database."
    redirect_to pokemons_path
  end

end





def upload
  csv_path = File.join Rails.root, 'db', 'pokemon.csv'
  CSV.foreach((csv_path), headers: true) do |pokemon|
    Pokemon.create(
      pokedex_id: pokemon[0],
      name: pokemon[1],
      height: pokemon[3],
      weight: pokemon[4])
    end
    flash[:notice] = "All 807 Pokemons added to db."
    redirect_to pokemons_path
  end

  def destroy_all
    Pokemon.destroy_all
    flash[:notice] = "All 807 Pokemons deleted from db."
    redirect_to pokemons_path
  end
