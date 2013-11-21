 # *** RAILS FOR ZOMBIES - Zombie Lab 4 ***

 # CONTROLLER

# /zombie_twitter/app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
	def show
		@tweet = Tweet.find(params[:id]) # (params[:id])
		render :action => 'status' # add this line of code if you want to render out status.html.erb
	end
end

# /app/views/tweets/show.html.erb
<h1><%= @tweet.status %><h1>

<p>Posted by <%= @tweet.zombie.name %></p>


# /app/views/tweets/status.html.erb
<h1><%= @tweet.status %><h1>

<p>Posted by <%= @tweet.zombie.name %></p>


# PARAMETERS
	# params = { :status => "I'm dead" }
	@tweet = Tweet.create(:status => params[:status])

	# Long version - params = {:tweet => { :status => "I'm dead" }}
	@tweet = Tweet.create(:status => params[:tweet][:status])

	# Short version - params = {:tweet => { :status => "I'm dead" }}
	@tweet = Tweet.create(params[:tweet])

# Render in xml & json
class TweetsController < ApplicationController

	def show
		@tweet = Tweet.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml  => @tweet } # Render to /tweets/1.xm1
			format.json { render :json => @tweet } # Render to /tweets/1.json
		end

	end

# /tweets/1.xml	
<%xml version"1.0" encoding="UTF-8"?>
<tweet>
	<id type="integer">1</id>
	<status>Where can I get a good bite to eat?</status>
	<zombie-id type ="integer">1</zombie-id>
</tweet>


# /tweets/1.json
{"tweet":{"id":1,"status":"Where can I get a good bite to eat?","zombie_id":1}}

# CONTROLLER ACTIONS
# /app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
	
	def index # List all tweets
	end

	def show    # Show a single tweet
	end

	def new     # Show a new tweet form
	end

	def edit    # Show an edit tweet form
	end

	def create  # Create a new tweet
	end
		
	def update  # Update a tweet
	end

	def destroy # Delete a tweet
	end

end


# ADDING SOME AUTHORIZATION
# /app/controllers/tweets_controller.rb
def edit
	@tweet = Tweet.find(params[:id])
end

# /zombie_twitter/app/views/tweets/edit.html.erb # Render to 'edit' views by default


# Long version - Redirect and Flash without edit authorization 
class TweetsController < ApplicationController
	def edit
		@tweet = Tweet.find(params[:id])

		if session[:zombie_id] != @tweet.zombie_id # session works like a per user hash
			flash[:notice] = "Sorry, you can't edit this tweet" # flash[:notice] to send messages to the user
			redirect_to(tweets_path) # redirect <path> to redirect the request
		end
	end
end


# Short version - Redirect and Flash without edit authorization 
class TweetsController < ApplicationController
	def edit
		@tweet = Tweet.find(params[:id])

		if session[:zombie_id] != @tweet.zombie_id # session works like a per user hash
			redirect_to(tweets_path,
				:notice => "Sorry, you can't edit this tweet")
		end
	end
end


# /app/views/layouts/application.html.erb = Header & Footer = layout
<!DOCTYPE html>
<html>
	<head>
		<title>twitter for Zombies</title>


	# ADDITIONAL LAYOUT COMPONENTS,
		# Include all stylesheets
		# /zombie_twiter/public/stylesheets 
		<%= styplesheet_link_tag :all %>
		# Renders
		<link href="/stylesheets/scaffold.css" media="screen" rel="stylesheet" type="text/css" /> 

		# Include default javascripts
		# Protyotype Javascript Framework
		# /zombie_twitter/public/javascripts 
		<%= javascript_include_tag :defaults %> 
		# Renders
		<script src="/javascripts/prototype.js" type="text/javascripts"></script> 


		# stop hacker from submit comment to your site
		# Automatically adds this to forms
		<%= csrf_meta_tag %>
		# Renders
		<meta name="csrf-param" content="authenticity_token"/>
		<meta name="csrf-token" content="I+d..jI"


	</head>
	<body>
		<img src="/images/twitter.png" />
		
		# Notice for Layouts
		<% if flash[:notice] %> 
			<div id="notice"><%= flash[:notice] %></div>
		<% end %>

		# Put the "Contents" = show content here
		<%= yield %> # show content

	</body></html>


# Short version - Redirect and Flash with edit, update, destroy authorization 
class TweetsController < ApplicationController
	before_filter :get_tweet, :only => [:edit, :update, :destroy]
	before_filter :check_auth, :only => [:edit, :update, :destroy]

	def get_tweet
		@tweet = Tweet.find(params[:id])
	end

	def check_auth
		if session[:zombie_id] != @tweet.zombie_id
			redirect_to(tweets_path,
				:notice => "Sorry, you can't edit this tweet")
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end
end