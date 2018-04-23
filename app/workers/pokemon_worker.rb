class PokemonWorker
  require 'csv'
  include Sidekiq::Worker
end
