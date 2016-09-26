require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
set :secret_number, SECRET_NUMBER

get '/' do
  guess = params["guess"].to_i
  phrase = check_guess(guess)
  erb :index, :locals => {:phrase => phrase}
end

def check_guess(guess)
  if guess > SECRET_NUMBER
    high(guess)
  elsif guess < SECRET_NUMBER
    low(guess)
  else
    "You got it right! The secret number is " + settings.secret_number.to_s
  end
end

def high(guess)
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  else
    "Too high!"
  end
end

def low(guess)
  if guess < SECRET_NUMBER - 5
    "Way too low!"
  else
    "Too low!"
  end
end
