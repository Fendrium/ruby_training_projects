require 'sinatra'
require 'sinatra/reloader'

get '/' do
  x = rand(4)
  "The SECRET NUMBER is #{x}"
end
