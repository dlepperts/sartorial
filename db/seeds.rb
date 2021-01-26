require 'faker'
# if error: uninitialized constant Faker::[some_class]
# change line in gemfile to: gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'


#client
5.times do 
    name = Faker::Name.unique.name
    # sex = Faker::Gender.short_binary_type
    Client.create(name: name, sex: sex)
end

#client address
5.times do 
    street = Faker::Address.street_name
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip
    client_id = Faker::Number.within(range: 1..5)
    Address.create(street_name: street, city: city, state: state, zip: zip_code, client_id: client_id)
end

#client/measurements
chest
bust
length 

#tailor/name
tiff = Tailor.create(name: 'Tiffany Danlyn', address_id: 1)
danielle = Tailor.create(name: 'Danielle Leppert', address_id: 2)
evan = Tailor.create(name: 'Evan Fujita', address_id: 3)
ev = Tailor.create(name: 'Evelyn Hernandez', address_id: 4)

#tailor address
4.times do 
    street = Faker::Address.street_name
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip
    tailor_id = Faker::Number.within(range: 1..4)
    Address.create(street_name: street, city: city, state: state, zip: zip_code, tailor_id: tailor_id)
end

#review
rev_1 = Review.create(tailor_id: 2, rating: 5, review: "I've been an online customer for years! The customer service is phenomenal the clothes always fit perfectly!")
rev_2 = Review.create(tailor_id: 1, rating: 5, review: "Tiffany made my wedding suit fit like a glove and looked exactly as I wanted. Fantastic service and every detail was takem care of")
rev_3 = Review.create(tailor_id: 4, rating: 1, review: "An absolute rip of!! Evelyn was so rude, never coming here again!")
rev_4 = Review.create(tailor_id: 3, rating: 5, review: "Evan did an amazing job tailoring my pants. They fit perfectly")
rev_5 = Review.create(tailor_id: 2, rating: 5, review: "I was hesitant using an online tailor, but Danielle helped all concerns and she did a fantastic job tailoring all my shirts")

#clothing items
item1 = Item.create(name: "Dress")
item2 = Item.create(name: "Skirt")
item3 = Item.create(name: "Pants")
item4 = Item.create(name: "Blouse")
item5 = Item.create(name: "Shirt")
item6 = Item.create(name: "Jacket")

#alterations
alteration1 = Alteration.create(client_id: 1, tailor_id: 1, clothing_item: 1, date: "2/1/2021")
alteration2 = Alteration.create(client_id: 2, tailor_id: 2, clothing_item: 2, date: "2/2/2021")
alteration3 = Alteration.create(client_id: 3, tailor_id: 3, clothing_item: 3, date: "2/3/2021")
alteration4 = Alteration.create(client_id: 4, tailor_id: 4, clothing_item: 4, date: "2/4/2021")
