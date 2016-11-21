# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create!(email: Faker::Internet.email,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: '123456')
  watch = Watch.new(name: "Rolex", description: "A beautiful watch", price: 50)
  watch.user = user
  watch.save
  url = "http://cdn2.jomashop.com/media/catalog/product/r/o/rolex-sea-dweller-4000-black-dial-stainless-steel-rolex-oyster-automatic-men_s-watch-116600bkso.jpg"
  watch.photo_url = url
end
