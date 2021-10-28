require 'sinatra'
require 'sinatra/cors'
require 'sinatra/reloader' if development?
require 'json'
class Thermostat < Sinatra::Base
  enable :sessions

  register Sinatra::Cors
  
  set :allow_origin, "*"
  set :allow_methods, "GET,HEAD,POST"
  set :allow_headers, "content-type,if-modified-since"
  set :expose_headers, "location,link"
  
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  data = {
    :temperature => nil
  }

  get "/temperature" do
    puts data[:temperature]
    content_type :json
    data[:temperature] == nil ? {temperature: "15"}.to_json : {temperature: data[:temperature]}.to_json
  end

  post "/temperature" do
    data[:temperature] = params[:temperature]
  end

end