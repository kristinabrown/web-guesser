require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = rand(100)

def check_guess(guess)
  if guess == nil
    ""
  elsif guess.to_i > NUMBER && (guess.to_i - NUMBER) >= 15
    "#{guess} is way too high!"
  elsif guess.to_i > NUMBER && (guess.to_i - NUMBER) < 15
    "#{guess} is too high!"
  elsif guess.to_i < NUMBER && (NUMBER - guess.to_i) >= 15
    "#{guess} is way too low!"
  elsif guess.to_i < NUMBER && (NUMBER - guess.to_i) < 15
    "#{guess} is too low!"
  elsif guess.to_i == NUMBER
    "Your guess #{guess} is spot on! Great job!"
  end
end

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  
  message = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :message => message, :guess => guess, :cheat => cheat}
end



