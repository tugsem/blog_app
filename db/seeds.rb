# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do |i|
  User.create(name: "#{i+1}.User", picture: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lacinia felis at quam dignissim, id rutrum mi volutpat. Donec ornare elit ante, ac accumsan odio aliquam non. Vestibulum augue ex, auctor nec hendrerit et, venenatis eget ante. Curabitur maximus, odio in pretium finibus, sapien eros mollis massa, sed sodales lorem tellus ac metus. Suspendisse sodales fringilla arcu, eget cursus purus maximus at. Aliquam eget felis non nulla placerat dapibus sit amet vel eros. Curabitur ac mi et ante bibendum maximus. Vivamus ac tempor augue, vel posuere nisi. Fusce in dictum orci. Etiam dignissim libero sit amet sem dictum scelerisque in eu purus.")
end
