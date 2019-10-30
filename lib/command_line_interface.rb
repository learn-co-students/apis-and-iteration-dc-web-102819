def welcome
  # puts out a welcome message here!
  puts "Welcome to our app."
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
  string = user_input
  string.downcase
end
