# *** RAILS FOR ZOMBIES - Zombie Lab 3 ***

# VIEW

# zombie_twitter directory tree and .erb = Embedded Ruby
	/zombie_twitter/app/views/zombies
	#List all tweets
	/zombie_twitter/app/views/tweets/index.html.erb 
	#View a tweet
	/zombie_twitter/app/views/tweets/show.html.erb 


# Evaluate as Ruby
<%    %>


# Evaluate as Ruby and Print result
<%=    %>


# /zombie_twitter/app/views/tweets/show.html.erb = Show a tweet 
# Show "Status of Tweet" and "Zombie's name created the Tweet"
<!DOCTYPE html>
<html>
	<head>
		<title>twitter for Zombies</title>


	# ADDITIONAL LAYOUT COMPONENTS
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

		<% tweet = Tweet.find(1) %>

		<h1><%= tweet.status %></h1>

		<p>Posted by <%= tweet.zombie.name %></p>

	</body></html>

# /app/views/layouts/application.html.erb = Header & Footer = layout
<!DOCTYPE html>
<html>
	<head>
		<title>twitter for Zombies</title>


	# ADDITIONAL LAYOUT COMPONENTS
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
		
		# Put the "Contents" = show content here
		<%= yield %> # show content

	</body></html>


# /app/views/tweets/show.html.erb = Contents = show content
		<% tweet = Tweet.find(1) %>

		<h1><%= tweet.status %></h1>

		<p>Posted by <%= tweet.zombie.name %></p>


# /zombie_twitter/public/images = Root path and images
http://ZombieTwitter.com/[something]

<img src="/images/twitter.png" # if exists in /public then use it, otherwise go to RAILS


# ADDING A LINK
	# /app/views/tweets/show.html.erb = regular post without link
	<p>Post by <%= tweet.zombie.name %></p>


	# /app/views/tweets/show.html.erb = adding a link 1
	# link_to tweet.zombie.name = Link Text
	# zombie_path(tweet.zombie) = Link Path (URL)
	<% link_to tweet.zombie.name, zombie_path(tweet.zombie) %>


	# Renders
	<a hef="/zombies/1">Ash</a> # Renders


	# /app/views/tweets/show.html.erb = adding a link 2
	# link_to tweet.zombie.name = Link Text
	# tweet.zombie = Link Path (URL)
	<%= link_to tweet.zombie.name, tweet.zombie %>


# METHOD link_to
	# Option 1 - Look in the source
	git clone http://github.com/rails/rails.git
	cd railsOpen your editor and search for "def link_to"


	# Option 2 - Look at api.rubyonrails.org
	search for link_to


	# Option 3 - Look at http://apidock.com/rails


	# Option 4 - Look at http://railsapi.com


# LIST TWEETS
	# /app/views/tweets/index.html.erb
	<h1>Listing tweets</h1>

	<table>
		<tr>
			<th>Status</th>
			<th>Zombie</th>
		</tr>

	# Tweet = class
	# Tweet.all = array of tweets
	# tweet = store each single tweet from the array tweets
	<% Tweet.all.each do |tweet| %>
		<tr>
			<td><%= tweet.status %></td>
			<td><%= tweet.zombie.name %></td>
		</tr>
	<% end %>
	</table>


# LIST TWEETS - CREATE LINKS
	# /app/views/tweets/index.html.erb
	# Tweet = class
	# Tweet.all = array of tweets
	# tweet = store each single tweet from the array tweets
	<% Tweet.all.each do |tweet| %>
		<tr>
			<td><%= link_to tweet.status, tweet %></td>
			<td><%= link_to tweet.zombie.name, tweet.zombie %></td>
		</tr>
	<% end %>


# LIST TWEETS - CREATE LINKS - Want to print out "No tweets found"
	# /app/views/tweets/index.html.erb
	# Tweet = class
	# Tweet.all = array of tweets
	# tweet = store each single tweet from the array tweets
	<% tweets = Tweet.all %>

	<% tweets.each do |tweet| %>

	<% if tweets.empty? %>
		<em>No tweets found</em>
	<% end %>


# LIST TWEETS - CREATE LINKS - EDIT & DELETE LINKS
	# /app/views/tweets/index.html.erb
	# Tweet = class
	# Tweet.all = array of tweets
	# tweet = store each single tweet from the array tweets
	<% Tweet.all.each do |tweet| %>
		<tr>
			<td><%= link_to tweet.status, tweet %></td>
			<td><%= link_to tweet.zombie.name, tweet.zombie %></td>
			<td><%= link_to "Edit", edit_tweet_path(tweet) %></td>
			<td><%= link_to "Delete", tweet, :method => :delete %></td>
		</tr>
	<% end %>

# ALL LINKS FOR TWEETS
	<%= link_to "<link text>", <code> %>
	# Link all tweets
	# /tweets
	tweets_path # <code>


	# New tweet forms
	# /tweets/New
	new_tweet_path # <code>


	tweet = Tweet.find(1) 
	# Show a tweet
	# /tweets/1
	tweet


	# Edit a tweet
	# /tweets/1/edit
	edit_tweet_path(tweet)


	# Delete a tweet
	# /tweets/1
	tweet, :method => :delete