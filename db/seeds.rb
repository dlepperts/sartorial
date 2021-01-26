# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#client/address
5.times do 
    name = Faker::Name.unique.name
    street = Faker::Address.street_name
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Adress.zip
    Client.create(name: name, street_name: street, city: city, state: state, zip: zip_code)
end

#client/measurements
chest
bust
length 

#tailor/name
tiff = Tailor.create(name: 'Tiffany Danlyn', street: '168 Duane st', city: 'New York', state: 'New York', zip: '10013')
danielle = Tailor.create(name: 'Danielle Leppert', street: '168 Duane st', city: 'New York', state: 'New York', zip: '10013')
evan = Tailor.create(name: 'Evan Fujita', street: '168 Duane st', city: 'New York', state: 'New York', zip: '10013')
ev = Tailor.create(name: 'Evelyn Hernandez', street: '168 Duane st', city: 'New York', state: 'New York', zip: '10013')


#review
rev_1 = Review.create(rating: 5, review: "I've been an online customer for years! The customer service is phenomenal the clothes always fit perfectly!")
rev_2 = Review.create(rating: 5, review: "Tiffany made my wedding suit fit like a glove and looked exactly as I wanted. Fantastic service and every detail was takem care of")
rev_3 = Review.create(rating: 1, review: "An absolute rip of!! Evelyn was so rude, never coming here again!")
rev_4 = Review.create(rating: 5, review: "Evan did an amazing job tailoring my pants. They fit perfectly")
rev_5 = Review.create(rating: 5, review: "I was hesitant using an online tailor, but Danielle helped all concerns and she did a fantastic job tailoring all my shirts")

