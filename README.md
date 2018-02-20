#Sinatra - Twitterwhack

This assignment creates a simple sinatra web app that allows users to play a
Twitter version of the Googlewhack game (http://en.wikipedia.org/wiki/Googlewhack).

The user provides two search terms, and we send requests to Twitter’s API to search
for recent tweets containing those words.
We'll use the results to calculate the user’s score and display a sample tweet that
contains their search terms.

The two search words entered by user are first_search_word and second_search_word.

The TwitterWhacker class does all the logic and connects to Twitter's API using
the Twitter API Keys. It creates a temporary client to communicate.

app.rb is the driver of the program.
