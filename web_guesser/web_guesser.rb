# Original Problem : http://tutorials.jumpstartlab.com/projects/web_guesser.html
# Solution lead : http://stackoverflow.com/questions/17659905/sinatra-ruby-random-number-keeps-changing-every-time-i-guess-scope-issue

require 'sinatra'
require 'sinatra/reloader'

# def check_guess(guess)

#  return message
# end

configure do
  enable :sessions
  set :session_secret, "somesecretstring"
end



get '/' do
  guess = params["guess"].to_i
  # message = check_guess(guess)

  start_state = true

  # Sets new number
  if start_state == true
    number = rand(101)
    NUMBER = number.freeze
    message = "Guess the number between 1 and 100"
  end

  if guess != NUMBER && guess != 0
    start_state = false
    if guess > NUMBER
      message = "Too high! The SECRET NUMBER is #{NUMBER}. #{@@life} HP liferemaining."
    elsif guess < number
      message = "Too low! The SECRET NUMBER is #{NUMBER}. #{@@life} HP remaining."
    end
  elsif guess == NUMBER
    message = "You got it right!"
    start_state = true
  else
    start_state = true
  end
  erb :index, :locals => { :message => message}
end
