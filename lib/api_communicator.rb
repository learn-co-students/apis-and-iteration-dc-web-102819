require 'rest-client'
require 'json'
require 'pry'

def api_to_json(url)
  api_string = RestClient.get(url)
  json_hash = JSON.parse(api_string)
end
  
def get_character_movies_from_api(character_name) #=> Passed 'luke skywalker'
  #make the web request
  characters = api_to_json('http://www.swapi.co/api/people/')["results"] #=> returns HASH containing :results[ {CHARACTER}, {CHARACTER} ]

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`

  ## THIS LINE WORKS
  # characters["results"].each do |character|
  person = characters.find { |character| character["name"].downcase == character_name }

      # person["films"].each do |film|
      #   movie_data = api_to_json(film)
      #   characterfilms.push(movie_data)
      # end

  person["films"].map { |film| movie_data = api_to_json(film) }

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
    puts "Star Wars Episode #{film["episode_id"]}: #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
