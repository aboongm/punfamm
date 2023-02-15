# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.first_or_create!(email: 'editor1@punfamm.com', password: 'password', password_confirmation: 'password', role: "editor")
User.create!(email: 'editor2@punfamm.com', password: 'password', password_confirmation: 'password', role: "editor")
User.create!(email: 'reporter1@punfamm.com', password: 'password', password_confirmation: 'password', role: "reporter")
User.create!(email: 'reporter2@punfamm.com', password: 'password', password_confirmation: 'password', role: "reporter")
User.create!(email: 'subscriber1@punfamm.com', password: 'password', password_confirmation: 'password', role: "subscriber")
User.create!(email: 'subscriber2@punfamm.com', password: 'password', password_confirmation: 'password', role: "subscriber")


Category.first_or_create!(title: 'World')
Category.create!(title: 'Politics')
Category.create!(title: 'Business')
Category.create!(title: 'Market')
Category.create!(title: 'Health')
Category.create!(title: 'Entertainment')
Category.create!(title: 'Tech')
Category.create!(title: 'Style')
Category.create!(title: 'Travel')
Category.create!(title: 'Sports')
Category.create!(title: 'Videos')
Category.create!(title: 'Features')
Category.create!(title: 'Weather')
Category.create!(title: 'Photos')
Category.create!(title: 'Longform')
Category.create!(title: 'Punfamm Profiles')
Category.create!(title: 'Punfamm Leadership')
Category.create!(title: 'Punfamm Newsletters')
Category.create!(title: 'Work for Punfamm')

category = Category.all
# category.each do |t|
#     2.times do |news|
#         NewsItem.create!(title: "#{news} News", content: "News body #{news}", category_id: t.id, author_id: 3)
#     end
# end
