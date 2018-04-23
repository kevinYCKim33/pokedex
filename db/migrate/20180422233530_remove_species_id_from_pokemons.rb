# rails g migration remove_species_id_from_pokemons species_id:integer --no-test-framework
class RemoveSpeciesIdFromPokemons < ActiveRecord::Migration[5.1]
  def change
    remove_column :pokemons, :species_id, :integer
  end
end
