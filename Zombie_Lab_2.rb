 # *** RAILS FOR ZOMBIES - Zombie Lab 2 ***

# MODELS
class Tweet < ActiveRecord::Base
end

# MODELS - Validations
class Tweet < ActiveRecord::Base
	validates :status, :presence => true, :length => { :minimum => 3}
end

# Validate uniqueness of a Zombie's name
validates_uniqueness_of :name

# Validate both uniqueness and the presence of the Zombie's name on a single line using the new validation syntax
validates :name, :presence => true, :uniqueness => true

# MODELS - Validations - Other Validations
:presence => true
:uniqueness => true
:numbericality => true
:length => { :minimum => 0, :maximum => 2000 }
:format => { :with => /.*/}
:inclusion => { :in => [1,2,3]}
:exclusion => { :in => [1,2,3]}
:acceptance => true

# MODELS - Relationships - A Tweet belongs to a Zombie
class Tweet < ActiveRecord::Base
	belongs_to :Zombie
end

# <Zombie id: 2, name: "Bob", graveyard: "Chapel Hill Cemetery">
z = Zombie.find(2)

# <Tweet id: 5, status: "Your eyelids taste like bacon.", zombie_id: 2>
t = Tweet.create(:status => "Your eyelids taste like bacon.", :zombie => z)

# <Zombie id: 2, name: "Bob", graveyard: "Chapel Hill Cemetery">
t.zombie

# <"Bob">
t.zombie.name


# MODELS - Relationships - A Zombie has many Tweets
class Zombie < ActiveRecord::Base
	has_many :Tweets
end

# <Zombie id: 1, name: "Ash", graveyard: "Glen Haven Cemetery">
ash = Zombie.find(1)

# <4>
ash.tweets.count

# [<Tweet id: 1, status: "Where can I get a good bite to eat?", zombie_ie: 1>. <Tweet id: 4, status: "OMG, my fingers turned green. #FML", zombie_id: 1>]
ash.tweets


# Exercise
	# Resource Route
	# Question - Create a resources route for zombies.
	TwitterForZombies::Application.routes.draw do
  		resources :zombies
	end

	# Route Matching
	# Question - Create a custom route so that '/undead' will go to the undead action on the ZombiesController.
	TwitterForZombies::Application.routes.draw do
  		match 'undead' => 'zombies#undead'
	end

	# Route Redirecting
	# Question - Create a redirect for '/undead' to '/zombies'
	TwitterForZombies::Application.routes.draw do
  		match '/undead' => redirect('/zombies')
	end

	# Root Route
	# Question - Create a root route to the ZombiesController index action.
	TwitterForZombies::Application.routes.draw do
  		root :to => 'zombies#index'
	end

	# Named Route
	# Question - Create a named route. It should generate a path like '/zombies/:name' where :name is a parameter, and points to the index action in ZombiesController. Name the route 'graveyard'
	TwitterForZombies::Application.routes.draw do
  		match '/zombies/:name' => 'zombies#index', :as => 'graveyard'
	end