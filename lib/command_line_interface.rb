require 'rest-client'
require 'pry'
require 'JSON'

RestClient.get('http://swapi.co/api/people/1')

def welcome
  puts "Welcome to our app."
  # puts out a welcome message here
end

def get_character_from_user
  puts "Please enter a character name"
  user_input = gets.chomp
  string = user_input
  string.downcase
  
  # use gets to capture the user's input. 
  #This method should return that input, downcased.
end
