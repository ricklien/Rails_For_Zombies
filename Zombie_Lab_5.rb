# *** RAILS FOR ZOMBIES - Zombie Lab 5 ***

# ROUTE
# /zombie_twitter/config/routes.rb 
ZombieTwitter::Application.routes.draw do |map|
	resources :tweets # REST resource

# CUSTOM ROUTES
	# //localhost:3000/new_tweet = //localhost:3000/tweets/new
	# 'new_tweet' = Path & "Tweets#new" = Controller
	# Controller name = Tweets
	# Action name = new
	match 'new_tweet' => "Tweets#new" 

	# //localhost:3000/all = //localhost:3000/tweets
	match 'all' => redirect('/tweets')

	# //localhost:3000/google = http://google.com
	match 'google' => redirect('http://www.google.com')

# ROOT ROUTE
	# //LOCALHOST:3000 = http://localhost:3000/tweets
	# Tweets = Controller & index = Action
	root :to => "Tweets#index" 

	# put it into a link
	<%= link_to "All Tweets", root_path %>

# ROUTE PARAMETERS
	# //app/controllers/tweets_controller.rb 
	# Find all zombie tweets in this zipcode
	def index
		if params[:zipcode]
			@tweets = Tweet.where(:zipcode => params[:zipcode])
		else
			@tweets = Tweet.all
		end

		respond_to do |format|
			format.html # index.html.erb
			format.xml { render :sml => @tweets }
		end

		# referenced by params[:zipcode] in controller
		match 'local_tweets/:zipcode' => 'Tweets#index'

		match 'local_tweets/:zipcode' => "Tweets#index", :as => 'local_tweets' 

		<%= link_to "Tweets in 32828", local_tweets_path(32828) %>
	end

end
	
	# REST resource
	# /tweets # URL Generated
	# def index # TweetsController action
	tweets_path

	# /tweet/<id> # URL Generated
	# def show # TweetsController action
	tweet

	# /tweets/new # URL Generated
	# def new # TweetsController action
	new_tweet_path

	# /tweets/<id>/edit # URL Generated
	# def edit # TweetsController action
	edit_tweet_path(tweet)