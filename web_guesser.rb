require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
set :secret_number, SECRET_NUMBER

get '/' do
  guess = params["guess"].to_i
  phrase = check_guess(guess)
  color = check_color(phrase)
  erb :index, :locals => {:phrase => phrase, :color => color}
end

def check_guess(guess)
  if guess == 0
    ""
  elsif guess > SECRET_NUMBER
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

def check_color(phrase)
  if phrase == ""
    "white"
  elsif phrase == "Way too high!" || phrase == "Way too low!"
    "red"
  elsif phrase == "Too high!" || phrase == "Too low!"
    "pink"
  else
    "green"
  end
end
