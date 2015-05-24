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

    enable :sessions

    get '/game' do
      session[:board] = Board.new(params[:width], params[:height])
      render 'batalla/inicio'
    end

    put 'small_ship' do

    end

    put 'long_ship' do

    end

    post 'shoot' do

    end

    post 'board_size' do

    end

    get 'board' do
      content_type :json
      Oj.dump board
    end

    def board
      session[:board] ||= Board.new(10, 10)
    end
  end
end
