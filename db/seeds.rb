require 'faker'
# if error: uninitialized constant Faker::[some_class]
# change line in gemfile to: gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

Client.destroy_all
Tailor.destroy_all
Review.destroy_all
ItemType.destroy_all
Measurement.destroy_all
Alteration.destroy_all


#client
35.times do 
    name = Faker::Name.unique.name
    street = Faker::Address.street_name
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip
    user = User.create(username: name, password: "abc", name: name, street: street, city: city, state: state, zip_code: zip_code)
    client_id = user.id
    waist = Faker::Number.within(range: 20..45)
    chest = Faker::Number.within(range: 28..45)
    hips = Faker::Number.within(range: 25..45)
    rise = Faker::Number.within(range: 5..10)
    neck = Faker::Number.within(range: 12..17)
    Measurement.create(waist: waist, chest_bust: chest, hips: hips, rise: rise, neck: neck, client_id: client_id)
end

#tailor
10.times do 
    name = Faker::Name.unique.name
    bio = Faker::GreekPhilosophers.quote
    street = Faker::Address.street_name
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip
    Tailor.create(name: name)
end

#review
# review_1 = Review.create(client_id: 1, tailor_id: 2, rating: 5, review: "I've been an online customer for years! The customer service is phenomenal the clothes always fit perfectly!")
# review_2 = Review.create(client_id: 2, tailor_id: 1, rating: 5, review: "Tiffany made my wedding suit fit like a glove and looked exactly as I wanted. Fantastic service and every detail was takem care of")
# review_3 = Review.create(client_id: 3, tailor_id: 4, rating: 1, review: "An absolute rip of!! Evelyn was so rude, never coming here again!")
# review_4 = Review.create(client_id: 4, tailor_id: 3, rating: 5, review: "Evan did an amazing job tailoring my pants. They fit perfectly")
# review_5 = Review.create(client_id: 5, tailor_id: 2, rating: 5, review: "I was hesitant using an online tailor, but Danielle helped all concerns and she did a fantastic job tailoring all my shirts")
35.times do
    client_id = Faker::Number.within(range: 1..35)
    tailor_id = Faker::Number.within(range: 1..10)
    rating = Faker::Number.within(range: 1..5)
    review = Faker::Lorem.paragraph
    Review.create(client_id: client_id, tailor_id: tailor_id, rating: rating, review: review)
end

#clothing items
item_1 = ItemType.create(name: "Dress")
item_2 = ItemType.create(name: "Skirt")
item_3 = ItemType.create(name: "Pants")
item_4 = ItemType.create(name: "Blouse")
item_5 = ItemType.create(name: "Shirt")
item_6 = ItemType.create(name: "Jacket")

#measurements
# measurement_1 = Measurement.create(waist: 32, chest_bust: 30, hips: 36, rise: 10, neck: 10, client_id: 1)
# measurement_2 = Measurement.create(waist: 40, chest_bust: 40, hips: 60, rise: 5, neck: 9, client_id: 2)
# measurement_3 = Measurement.create(waist: 50, chest_bust: 50, hips: 40, rise: 8, neck: 12, client_id: 3)
# measurement_4 = Measurement.create(waist: 52, chest_bust: 43, hips: 50, rise: 9, neck: 8, client_id: 4)
# measurement_5 = Measurement.create(waist: 44, chest_bust: 39, hips: 39, rise: 10, neck: 12, client_id: 5)


#alterations
# alteration_1 = Alteration.create(client_id: 1, tailor_id: 1, item_type_id: 1, date: "2/1/2021", comments: "Tight Fit")
# alteration_2 = Alteration.create(client_id: 2, tailor_id: 2, item_type_id: 2, date: "2/2/2021", comments: "Loose Fit")
# alteration_3 = Alteration.create(client_id: 3, tailor_id: 3, item_type_id: 3, date: "2/3/2021", comments: "Leave knee holes alone")
# alteration_4 = Alteration.create(client_id: 4, tailor_id: 4, item_type_id: 4, date: "2/4/2021", comments: "Urgent")

100.times do
    client_id = Faker::Number.within(range: 1..35)
    tailor_id = Faker::Number.within(range: 1..10)
    item_type_id = Faker::Number.within(range: 1..6)
    date = Faker::Date.backward(days: 100)
    comments = Faker::Movies::Lebowski.quote
    Alteration.create(client_id: client_id, tailor_id: tailor_id, item_type_id: item_type_id, date: date, comments: comments)
end
