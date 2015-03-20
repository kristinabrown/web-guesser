require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  "The secret number is #{number}"
end

