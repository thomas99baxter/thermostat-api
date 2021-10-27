require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
class Thermostat < Sinatra::Base

  enable :sessions
  
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get "/temperature" do
    content_type :json
    return {temperature: session[:temperature]}.to_json
  end

  post "/temperature" do
    p params[:temperature]
    session[:temperature] = params[:temperature]
  end

end