# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

movies = RestClient.get 'https://api.themoviedb.org/3/discover/movie?api_key=ed7d0309eef7d103fe51cfd7d89e7c77&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1'

