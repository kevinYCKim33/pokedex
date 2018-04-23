class PokemonsController < ApplicationController
  require 'csv'

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
