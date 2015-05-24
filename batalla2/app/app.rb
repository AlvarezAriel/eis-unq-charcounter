module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

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
