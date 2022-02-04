# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!
# in terminal, I run these 3 commands
#   rails generate model Movie
#   rails generate model Person
#   rails generate model Role
# then I migrate through this command
#   rails db:migrate

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

actor_list = [ "Christopher Nolan",
                "Christian Bale",
                "Michael Caine",
                "Liam Neeson",
                "Katie Holmes",
                "Gary Oldman",
                "Heath Ledger",
                "Aaron Eckhart",
                "Maggie Gyllenhaal",
                "Tom Hardy",
                "Joseph Gordon-Levitt", 
                "Anne Hathaway" ]

for actor in actor_list
    new_person = Person.new
    new_person.name = actor
    new_person.save
end

nolan = Person.where({name: "Christopher Nolan"})[0]
#nolan_id = nolan.id

values = {  title: "Batman Begins",
            year_released: "2005",
            rated: "PG-13",
            director_id: nolan.id }
movie1 = Movie.new(values)
movie1.save

values = {  title: "The Dark Knight",
            year_released: "2008",
            rated: "PG-13",
            director_id: nolan.id }
movie2 = Movie.new(values)
movie2.save

values = {  title: "The Dark Knight Rises",
            year_released: "2012",
            rated: "PG-13",
            director_id: nolan.id }
movie3 = Movie.new(values)
movie3.save

# character_list = [ "Bruce Wayne",
#                     "Alfred",
#                     "Ra's Al Ghul",
#                     "Rachel Dawes",
#                     "Commissioner Gordon",
#                     "Joker",
#                     "Harvey Dent",
#                     "Bane",
#                     "John Blake",
#                     "Selina Kyle" ]

# for character in character_list
#     new_character = Role.new
#     new_character.character_name = character
#     new_character.save
# end

batman_begins = Movie.where({ title: "Batman Begins" })
dark_knight = Movie.where({ title: "The Dark Knight" })
dark_knight_rises = Movie.where({ title: "The Dark Knight Rises" })

c_bale = Person.where({ name: "Christian Bale" })
m_caine = Person.where({ name: "Michael Caine" })
l_neeson = Person.where({ name: "Liam Neeson" })
k_holmes = Person.where({ name: "Katie Holmes" })
g_oldman = Person.where({ name: "Gary Oldman" })
h_ledger = Person.where({ name: "Heath Ledger" })
a_eckhart = Person.where({ name: "Aaron Eckhart" })
m_gyllenhaal = Person.where({ name: "Maggie Gyllenhaal" })
t_hardy = Person.where({ name: "Tom Hardy" })
j_g_levitt = Person.where({ name: "Joseph Gordon-Levitt" }) 
a_hathaway = Person.where({ name: "Anne Hathaway"  })

c_bale_id = c_bale.id
puts c_bale_id

# values = { movie_id: batman_begins.id, 
#             actor_id: c_bale.id, 
#             character_name: "Bruce Wayne" }
# role = Role.new(values)
# role.save

# values = { movie_id: batman_begins.id, 
#             actor_id: m_caine.id, 
#             character_name: "Alfred" }
# role = Role.new(values)
# role.save

# values = { movie_id: batman_begins.id, 
#             actor_id: l_neeson.id, 
#             character_name: "Ra's Al Ghul" }
# role = Role.new(values)
# role.save

# values = { movie_id: batman_begins.id, 
#             actor_id: l_neeson.id, 
#             character_name: "Ra's Al Ghul" }
# role = Role.new(values)
# role.save

# values = { movie_id: batman_begins.id, 
#             actor_id: k_holmes.id, 
#             character_name: "Rachel Dawes" }
# role = Role.new(values)
# role.save

# values = { movie_id: batman_begins.id, 
#             actor_id: g_oldman.id, 
#             character_name: "Commissioner Gordon" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight.id, 
#             actor_id: c_bale.id, 
#             character_name: "Bruce Wayne" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight.id, 
#             actor_id: h_ledger.id, 
#             character_name: "Joker" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight.id, 
#             actor_id: a_eckhart.id, 
#             character_name: "Harvey Dent" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight.id, 
#             actor_id: m_caine.id, 
#             character_name: "Alfred" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight.id, 
#             actor_id: m_gyllenhaal.id, 
#             character_name: "Rachel Dawes" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight_rises.id, 
#             actor_id: c_bale.id, 
#             character_name: "Bruce Wayne" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight_rises.id, 
#             actor_id: g_oldman.id, 
#             character_name: "Commissioner Gordon" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight_rises.id, 
#             actor_id: t_hardy.id, 
#             character_name: "Bane" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight_rises.id, 
#             actor_id: j_g_levitt.id, 
#             character_name: "John Blake" }
# role = Role.new(values)
# role.save

# values = { movie_id: dark_knight_rises.id, 
#             actor_id: a_hathaway.id, 
#             character_name: "Selina Kyle" }
# role = Role.new(values)
# role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

#for movie in Movie.all
#    puts movie.title
#end

#for person in Person.all
#    puts person.name
#end

for character in Role.all
    puts character.character_name
end

# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!