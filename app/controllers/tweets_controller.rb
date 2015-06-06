class TweetsController < ApplicationController

  def index
  end

  def display_tweet
    user_name = params[:tweet_value]
    tweet_number = params[:tweet_number].to_i
    render text: obtain(user_name, tweet_number)
  end

  def obtain(user, number)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = ENV["MY_ACCESS_TOKEN"]
      config.access_token_secret = ENV["MY_ACCESS_SECRET"]
    end

    tweet_array = []
    client.user_timeline(user).take(number).each do |i|
      tweet_array.push(i.text)
    end
    tweet_array
  end

end
