#rails g model Pokemon
class CreatePokemons < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :species_id
      t.integer :height
      t.integer :weight
    end
  end
end
