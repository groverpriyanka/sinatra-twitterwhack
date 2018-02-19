require 'twitter'
require 'pry-byebug'

class TwitterWhacker
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "WqXu9gHM4Cxf5E5WbA96xpqgQ"
      config.consumer_secret     = "oSDAwcnwiIZdBQ3EFIqpdr5l9KVAu0Fsuo80IWO1eiSPg2RZbd"
      config.access_token        = "383748788-7ImS90eU9NFaK0YtnwGtppNsicW01DIUD0nPHmMv"
      config.access_token_secret = "EbMLMWhSIp58YWN08hrWekIRU0j4pmGxj0yQbGPlsPgfp"
    end
  end

  def search_words (first_word, second_word)
    @results = @client.search("#{first_word} #{second_word}", result_type: "recent").take(100)
  end

  def score (first_word, second_word)
    @results_one = @client.search("#{first_word}", result_type: "recent").take(100)
    @results_two = @client.search("#{second_word}", result_type: "recent").take(100)
    @results_one.count * @results_two.count
  end

  def index
    if @results.nil?
      0
    else
      @results.count
    end
  end

  def example
    return @results.first
  end

end
