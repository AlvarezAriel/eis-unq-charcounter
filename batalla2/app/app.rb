require 'sprockets'

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
    
    get '/' do
      File.read(File.join('public', 'index.html'))
    end

    get 'mipagina' do
      render 'batalla/inicio'
    end

    post 'mipagina' do
      @nombre = params[:nombre]
      render 'batalla/inicio' 
    end

  end
end
