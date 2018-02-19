require 'pry-byebug'
require 'sinatra'
require 'sinatra/activerecord'
# require './models/model'
# require './models/event'
# require './models/person'
# require './models/registration'
require './config/environments' #database configuration
require_relative 'TwitterWhacker.rb'

get '/' do
	erb :index
end

post '/results' do
	whacking_twitter = TwitterWhacker.new
	first_search_word = params[:first_search_word]
	second_search_word = params[:second_search_word]
	@results = whacking_twitter.search_words(first_search_word, second_search_word)
	@index = whacking_twitter.index
	@score = whacking_twitter.score(first_search_word, second_search_word)
	@example = whack.example
	if @index == 0
		@text = "You got whacked!"
	elsif @index < 5
		@text = "Excellent!"
	elsif @index < 90
		@text = "Pretty good!"
	else
		@text = "Try again!"
	end

	erb :results
end
