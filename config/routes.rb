Rails.application.routes.draw do

  root "tweets#index"

  get "/tweet" => "tweets#display_tweet"

end
