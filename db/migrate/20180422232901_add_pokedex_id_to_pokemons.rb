 # rails g migration add_pokedex_id_to_pokemons pokedex_id:integer --no-test-framework
class AddPokedexIdToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :pokedex_id, :integer
  end
end
