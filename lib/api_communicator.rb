require 'rest-client'
require 'json'
require 'pry'

def get_json(url)
  #method to make web request
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
  response_hash
end

def get_character_movies_from_api(character_name)
  film_info=[]
  char_films = nil
  #use get_json method to make web request
  response_hash = get_json('http://www.swapi.co/api/people/')
  response_hash["results"].each do |character|
    if character["name"].downcase == character_name
      char_films = character["films"]
    end
  end
  #store json info for each film in film_info array
  char_films.each do |film|
    film_info << get_json(film)
  end
  #return array of film info
  film_info



  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    puts film["title"]
  end

end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  #binding.pry
  print_movies(films)
end

def get_films_with_r(character)
  #iterate over character's films and return all that start with 'r'
  films = get_character_movies_from_api(character)
  r_films = films.find_all {|film|film["title"][0].downcase=="r"}
  puts "**************"
  r_films.each do |film|
    puts film["title"]
  end
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
