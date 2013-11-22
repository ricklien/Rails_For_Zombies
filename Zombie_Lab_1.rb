# *** RAILS FOR ZOMBIES - Zombie Lab 1 ***

# CRUD - Create 1
t = Tweet.new
t.status = "I <3 brains."
t.save

# CRUD - Create 2
t = Tweet.new(:status => "I <3 brains", :zombie => "Jim")

# CRUD - Create 3
Tweet.create(:status => "I <3 brains", :zombie => "Jim")


# CRUD - Read
Tweet.find(3)

# CRUD - Read - Returns a single item
Tweet.find(2)

# CRUD - Read - Returns an array
Tweet.find(3, 4, 5)

# CRUD - Read - Returns the first tweet
Tweet.first

# CRUD - Read - Returns the last tweet
Tweet.last

# CRUD - Read - Returns all the tweets
Tweet.all

# CRUD - Read - Returns number of tweets
Tweet.count

# CRUD - Read - All ordered by zombie
Tweet.order(:zombie)

# CRUD - Read - Only 10 tweets
Tweet.limit(10)

# CRUD - Read - Only tweets by Ash
Tweet.where(:zombie => "ash")

# CRUD - Read - method chaining
Tweet.where(:zombie => "ash").order(:zombie).limit(10)


# CRUD - Update 1
t = Tweet.find(3)
t.zombie = "EyeballChoper"
t.save

# CRUD - Update 2
t = Tweet.find(2)
t.attributes = {
			:status => "Can I munch your eyeballs?"
			:zombie => "EyeballChomper"
			}

# CRUD - Update 3
t = Tweet.find(2)
t.update_attributes(
			:status => "Can I munch your eyeballs?"
			:zombie => "EyeballChomper"
			)

# CRUD - Delete 1
t = Tweet.find(3)
t.destroy

# CRUD - Delete 2
Tweet.find(2).destroy

# CRUD - Delete - Delete all
Tweet.destroy_all

# EXERCISE

	# Find 1
	# Question - Try to find a Zombie where the ID is 1
	Zombie.find(1)


	# Create
	# Question - Create a new Zombie.
	Zombie.create

	# Find II
	# Question - Find the last Zombie in the database, but don't use IDs
	Zombie.last

	# Query 
	# Question - Find all Zombies ordered by their names.
	Zombie.all

	# Update
	# Question - Update Zombie 3's graveyard to 'Benny Hills Memorial'
	z = Zombie.find(3)
	z.graveyard = "Benny Hills Memorial"
	z.save
	
	# destroy
	# Question - Destroy the Zombie with an ID of 3.
	Zombie.fin­d(3).destr­oy 

