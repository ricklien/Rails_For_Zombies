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









# /app/views/layouts/application.html.erb = The main layout for website
application.html.erb












# /zombie_twitter/public/images = Root path and images
http://ZombieTwitter.com/[something]

<img src="/images/twitter.png" # if exists in /public then use it, otherwise go to RAILS

# /app/views/tweets/show.html.erb = Adding a link
<p>Post by <%= tweet.zombie.name %></p>

# adding a link 1
<% link_to tweet.zombie.name, zombie_path(tweet.zombie) %>

<a hef="/zombies/1">Ash</a> # Renders

# adding a link 2
<%= link_to tweet.zombie.name, tweet.zombie %>

