require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.turn)
    redirect '/lose_game' if @game.player_loses?(@game.opponent?)
    @game.switch_turn
    erb :attack
  end

  get '/switch_turn' do
    redirect '/play'
  end

  get '/lose_game' do
    @game = $game
    erb :lose_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
