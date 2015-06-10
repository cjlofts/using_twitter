class TweetsController < ApplicationController

  def index
  end

  def display_tweet
    user_name = params[:tweet_value]
    tweet_number = params[:tweet_number].to_i
    render json: obtain(user_name, tweet_number)
  end

  def obtain(user, number)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = ENV["MY_ACCESS_TOKEN"]
      config.access_token_secret = ENV["MY_ACCESS_SECRET"]
    end

    def nice_date(date)
      without_time = date[0...-15]
      new_date = without_time[8..9] + "/" + without_time[5..6] + "/" + without_time[2..3]
    end
    
    def nice_time(date)
      date[11...-9]
    end

    tweet_hash = {}
    client.user_timeline(user).take(number).each do |i|
      date = i.created_at.to_s
      date_part = nice_date(date)
      time_part = nice_time(date)
      full_date = date_part + " at " + time_part
      tweet_hash[full_date] = i.text
    end
    tweet_hash
  end

end
