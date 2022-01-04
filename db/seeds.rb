User.destroy_all
Friendship.destroy_all
Kitchen.destroy_all
ShoppingList.destroy_all
FoodLog.destroy_all
Recipe.destroy_all
Item.destroy_all


puts "Seeding starting!"

puts "Creating Users"
User.create!(email: "jharlan628@gmail.com", password: "jah", name: "Jesse Harlan", house_number: 10, address: "City Point", address_extras: "Apt. 20G", city: "Brooklyn", state: "New York")
User.create!(email: "abharlan@aol.com", password: "12Fellow", name: "Amy Harlan", house_number: 12509, address: "Fellowship Ct.", address_extras: "", city: "Reisterstown", state: "Maryland")

puts "Creating Friendships"
Friendship.create!(user_id: 1, friend_id: 2)
Friendship.create!(user_id: 2, friend_id: 1)

puts "Creating Kitchens"
Kitchen.create!(id: 1, user_id: 1)
Kitchen.create!(id: 2, user_id: 2)

puts "Creating Recipes"
Recipe.create!(user_id: 1, name: "Recipe", length_minutes: 4, instructions: "make the damn thing", favorite: false)

puts "Creating Shopping Lists"
ShoppingList.create!(id:1, user_id:1)
ShoppingList.create!(id: 2, user_id:2)

puts "Creating Food Logs"
FoodLog.create!(user_id:1, item: "Carrot", amount: 2, remove_from_kitchen: true )
FoodLog.create!( user_id:1, item: "Chicken", amount: 3, remove_from_kitchen: true )
FoodLog.create!(user_id:1, item: "Oreos",  amount: 4,  remove_from_kitchen: true )
FoodLog.create!(user_id:2)

puts "Creating Edible Items"


Item.create!(user_id: 1, kitchen_id: 1, name: "Carrot", food_group: "Vegetable", description: "", amount: 13, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://i.ndtvimg.com/mt/cooks/2014-11/carrots.jpg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Chicken", food_group: "Protein", description: "", amount: 21, measurement_type: "thighs", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://www.seriouseats.com/thmb/v0P7cGg-Jnm8ZmowR74V3tSvs-Y=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__images__2014__04__20140403-knife-skills-deboning-chicken-thigh-01-c48f3632914d4937becc7caaddb04102.jpg" )

Item.create!(user_id: 1, kitchen_id: 1, name: "Oreos", food_group: "Dessert", description: "", amount: 33, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: false, in_pantry: true, imgurl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Oreo-Two-Cookies.png/1200px-Oreo-Two-Cookies.png")


21.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: Faker::Food.ingredient, food_group: "", description: Faker::Food.description, amount: Faker::Number.within(range: 1..19), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end


19.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: Faker::Food.ingredient, food_group: "", description: Faker::Food.description, amount: Faker::Number.within(range: 1..19), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: true, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end

17.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: Faker::Food.ingredient, food_group: "", description: Faker::Food.description, amount: Faker::Number.within(range: 1..25), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: false, in_pantry: true, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end

4.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: Faker::Food.ingredient, food_group: "", description: Faker::Food.description, amount: Faker::Number.within(range: 1..25), measurement_type: "units", in_kitchen: true, in_shopping_list: true, in_fridge: false, in_freezer: false, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end





puts "Seeding finished!"