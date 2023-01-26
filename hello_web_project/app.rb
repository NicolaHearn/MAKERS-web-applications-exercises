require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    name = params[:name]
    return "Hello #{name}"
  end

  get '/hello' do

    @name = params[:name]
    return erb(:index)
  end


  # post '/submit' do
  #   name = params[:name]
  #   message = params[:message]

  #   return "Thanks #{name}, you sent this message: #{message}"

  # end

  get '/names' do
    name_1 = params[:name_1]
    name_2 = params[:name_2]
    name_3 = params[:name_3]
  
    return "#{name_1} #{name_2} #{name_3}"

  end

  post '/sort-names' do
    name_1 = params[:name_1]
    name_2 = params[:name_2]
    name_3 = params[:name_3]

    names = []
    names << name_1
    names << name_2
    names << name_3

    return names.sort.join(" ")
  end
end 