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
      board_action { |x,y| board.add_ship(Ship.small_at(x,y)) }
    end

    put '/long_ship', :provides => :json do
      board_action { |x,y| board.add_ship(Ship.large_at(x,y)) }
    end

    put '/shoot', :provides => :json do
      board_action { |x,y| board.shoot_at(x,y) }
    end

    get '/board' do
      content_type :json
      Oj.dump board
    end

    def board_action(&block)
      position = JSON.parse request.body.read
      block.call(position[0].to_i,position[1].to_i)
      content_type :json
      Oj.dump board
    end

    def board
      session[:board] ||= Board.new(10, 10)
    end
  end
end
