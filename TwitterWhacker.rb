require 'twitter'
require 'pry-byebug'

# Accessing Twiiter's API using twitter API keys
class TwitterWhacker
  def initialize
    @client = Twitter::REST::Client.new do |c|
      c.consumer_key        = "WqXu9gHM4Cxf5E5WbA96xpqgQ"
      c.consumer_secret     = "oSDAwcnwiIZdBQ3EFIqpdr5l9KVAu0Fsuo80IWO1eiSPg2RZbd"
      c.access_token        = "383748788-7ImS90eU9NFaK0YtnwGtppNsicW01DIUD0nPHmMv"
      c.access_token_secret = "EbMLMWhSIp58YWN08hrWekIRU0j4pmGxj0yQbGPlsPgfp"
    end
  end

# result_type as recent returns only the most recent results in the response.
# Other values include mixed : includes both popular and real time results in the response.
# and popular : returns only the most popular results in the response.
  def search_words (first_word, second_word)
      @results = @client.search("#{first_word} #{second_word}", result_type: "recent").take(100)
  end

# The Twitterwhack index is simply the number of results which contained both of their
# search terms, up to the maximum of 100.
  def index
    if @results.nil?
      @index = 0
    else
      @index = @results.count
    end
    return @index
  end

# Printing a comment as per index
 def index_comment
   i = @index
   if i.nil?
     @displayText = nil
   elsif i == 0
   		@displayText = "You got whacked!! ^_^ "
   	elsif i <= 5
   		@displayText = "Excellent!!"
    elsif i <= 20
      @displayText = "Good!!"
    elsif i <= 60
      @displayText = "Okay!!"
   	elsif i <= 90
   		@displayText = "Not that good!!"
   	else
   		@displayText = "OOPS. Try again!"
   	end
    return @displayText
  end

# The Twitterwhack score is the product of the number of results which had the first
# term and the number which had the second term, up to the maximum
  def score (first_word, second_word)
    @results_first_word = @client.search("#{first_word}", result_type: "recent").take(100)
    @results_second_word = @client.search("#{second_word}", result_type: "recent").take(100)
    @score = @results_first_word.count * @results_second_word.count
    return @score
  end

# Access first tweet
  def example
    return @results.first
  end
end
