# *** RAILS FOR ZOMBIES - Zombie Lab 2 ***

# MODELS - Validations
class Tweet < ActiveRecord::Base
	validates :status, :presence => true, :length => { :minimum => 3}
end

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