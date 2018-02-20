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
	first_search_word = params[:first_search_word]
	second_search_word = params[:second_search_word]
	tw = TwitterWhacker.new
	@results = tw.search_words(first_search_word, second_search_word)
	@index = tw.index
	@score = tw.score(first_search_word, second_search_word)
	@example = tw.example
	@displayText = tw.index_comment
	erb :results
end
