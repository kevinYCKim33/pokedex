class PokemonRemoveWorker < PokemonWorker
  def perform
    Pokemon.destroy_all
  end
end
