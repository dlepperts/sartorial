require 'faker'
# if error: uninitialized constant Faker::[some_class]
# change line in gemfile to: gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

Client.destroy_all
Tailor.destroy_all
Review.destroy_all
ItemType.destroy_all
Measurement.destroy_all
Alteration.destroy_all


#client/user
35.times do 
    client = Client.create
    name = Faker::Name.unique.name
    street = Faker::Address.street_name
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip
    user = User.create(username: name, password: "abc", name: name, street: street, city: city, state: state, zip_code: zip_code, usable_type: "Client", usable_id: client.id)
    waist = Faker::Number.within(range: 20..45)
    chest = Faker::Number.within(range: 28..45)
    hips = Faker::Number.within(range: 25..45)
    rise = Faker::Number.within(range: 5..10)
    neck = Faker::Number.within(range: 12..17)
    Measurement.create(waist: waist, chest_bust: chest, hips: hips, rise: rise, neck: neck, client_id: client.id)
end

#tailor
15.times do 
    tailor = Tailor.create
    name = Faker::Name.unique.name
    street = Faker::Address.street_name
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip
    user = User.create(username: name, password: "abc", name: name, street: street, city: city, state: state, zip_code: zip_code, usable_type: "Tailor", usable_id: tailor.id)
end

100.times do
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

100.times do
    client_id = Faker::Number.within(range: 1..35)
    tailor_id = Faker::Number.within(range: 1..10)
    item_type_id = Faker::Number.within(range: 1..6)
    date = Faker::Date.backward(days: 100)
    comments = Faker::Movies::Lebowski.quote
    Alteration.create(client_id: client_id, tailor_id: tailor_id, item_type_id: item_type_id, date: date, comments: comments)
end
