# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting reservations"
Reservation.destroy_all

puts "Deleting offers"
Offer.destroy_all

puts "Deleting users"
User.destroy_all

puts "Creating offers"

user1 = User.create!(email: "clariursini@gmail.com", password: "123456", full_name: "Clara Ursini")
user2 = User.create!(email: "valenursini@gmail.com", password: "123456", full_name: "Valen Ursini")

puts "Done"

puts "Creating offers"

offer1 = Offer.create!(user: user1, title: "Quinta en Pilar", description: "Muy lindo con mucho pasto y lugar para correr", location: "Pilar, Buenos Aires", price_per_night: 2000)
offer2 = Offer.create!(user: user1, title: "Hermosa casa en Escobar", description: "Super estadia en Escobar para tu mascota", location: "Escobar, Buenos Aires", price_per_night: 3000)
offer3 = Offer.create!(user: user2, title: "Casa con patio", description: "Hermosa casa con amplio patio, cuido a tu mascota", location: "Caballito, Buenos Aires", price_per_night: 1500)

puts "Done"

puts "Creating reservations"

Reservation.create!(offer: offer1, user: user1, date_checkin: Date.parse('2022-10-03'), date_checkout: Date.parse('2022-10-10'), guests: 2, confirmed: false)
Reservation.create!(offer: offer2, user: user1, date_checkin: Date.parse('2022-9-10'), date_checkout: Date.parse('2022-9-20'), guests: 1, confirmed: true)
Reservation.create!(offer: offer3, user: user2, date_checkin: Date.parse('2022-12-03'), date_checkout: Date.parse('2022-12-10'), guests: 3, confirmed: false)

puts "Done"
