require 'json'
require 'oj'

module Battleship

  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    register Padrino::Sprockets
    sprockets :paths => Padrino::Angularjs.assets_path
    register Padrino::Sprockets

    require 'sprockets'
    register Padrino::Sprockets
    sprockets

    set :protect_from_csrf, false

    enable :sessions

    get '/game' do
      session[:board] = Board.new(params[:width].to_i, params[:height].to_i)
      render 'batalla/inicio'
    end

    put '/small_ship', :provides => :json do
      position = JSON.parse request.body.read
      puts (position[1])
      b= board
      b.add_ship(Ship.small_at(position[0].to_i,position[1].to_i))
      # self.board.add_ship(Ship.small_at(position[0],position[1]))

      content_type :json
      Oj.dump b
    end

    put '/long_ship', :provides => :json do

    end

    put '/shoot', :provides => :json do

    end

    post '/board_size', :provides => :json do

    end

    get '/board' do
      content_type :json
      Oj.dump board
    end

    def board
      session[:board] ||= Board.new(10, 10)
    end
  end
end
