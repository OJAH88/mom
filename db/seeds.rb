User.destroy_all
Friendship.destroy_all
Kitchen.destroy_all
ShoppingList.destroy_all
FoodLog.destroy_all
Recipe.destroy_all
Item.destroy_all


puts "Seeding starting!"

puts "Creating Users"
User.create!(email: "foo@bar.com", password: "test", name: "Test User", house_number: 1, address: "City Point", address_extras: "", city: "Brooklyn", state: "New York")
# User.create!(email: "abharlan@aol.com", password: "12Fellow", name: "Amy Harlan", house_number: 12509, address: "Fellowship Ct.", address_extras: "", city: "Reisterstown", state: "Maryland")

# puts "Creating Friendships"
# Friendship.create!(user_id: 1, friend_id: 2)
# Friendship.create!(user_id: 2, friend_id: 1)

puts "Creating Kitchens"
Kitchen.create!(id: 1, user_id: 1)
# Kitchen.create!(id: 2, user_id: 2)

puts "Creating Recipes"
Recipe.create!(user_id: 1, name: "Recipe", length_minutes: 4, instructions: "make the damn thing", favorite: false)

puts "Creating Shopping Lists"
ShoppingList.create!(id:1, user_id:1)
# ShoppingList.create!(id: 2, user_id:2)

puts "Creating Food Logs"
FoodLog.create!(user_id:1, item: "Carrot", amount: 2, remove_from_kitchen: true )
FoodLog.create!( user_id:1, item: "Chicken", amount: 3, remove_from_kitchen: true )
FoodLog.create!(user_id:1, item: "Oreos",  amount: 4,  remove_from_kitchen: true )
# FoodLog.create!(user_id:2)

puts "Creating Edible Items"


Item.create!(user_id: 1, kitchen_id: 1, name: "Carrot", food_group: "Vegetable", description: "The carrot is a root vegetable, typically orange in color, though purple, black, red, white, and yellow cultivars exist, all of which are domesticated forms of the wild carrot, Daucus carota, native to Europe and Southwestern Asia.", amount: 6, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://i.ndtvimg.com/mt/cooks/2014-11/carrots.jpg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Cucumber", food_group: "Vegetable", description: "Cucumber is a widely-cultivated creeping vine plant in the Cucurbitaceae family that bears usually cylindrical fruits, which are used as vegetables. Considered an annual plant, there are three main varieties of cucumber — slicing, pickling, and burpless/seedless — within which several cultivars have been created.", amount: 4, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://cdn.mos.cms.futurecdn.net/EBEXFvqez44hySrWqNs3CZ.jpg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Apple", food_group: "Fruit", description: "An apple is an edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today.", amount: 4, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://www.applesfromny.com/wp-content/uploads/2020/06/SnapdragonNEW.png")

Item.create!(user_id: 1, kitchen_id: 1, name: "Strawberry", food_group: "Fruit", description: "The garden strawberry is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness. ", amount: 1, measurement_type: "container", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://assets.bonappetit.com/photos/58dbf6c8a6614f6f50816994/4:3/w_2591,h_1943,c_limit/20170323%20MOB6231_FINAL_crop.jpg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Frozen Strawberries", food_group: "Fruit", description: "A bag of frozen strawberries", amount: 2, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: true, in_pantry: false, imgurl: "https://i5.walmartimages.com/asr/763629c1-8d89-4878-b565-70ebc2631d15_3.a9bfbca535e87648520e9d876decbb4d.jpeg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Rye Bread", food_group: "Starch", description: "Rye bread is a type of bread made with various proportions of flour from rye grain. It can be light or dark in color, depending on the type of flour used and the addition of coloring agents, and is typically denser than bread made from wheat flour.", amount: 2, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://www.carolinescooking.com/wp-content/uploads/2018/10/sourdough-rye-bread-photo.jpg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Ice Cream", food_group: "Dessert", description: "Ice cream is a sweetened frozen food typically eaten as a snack or dessert. It may be made from milk or cream and is flavoured with a sweetener, either sugar or an alternative, and a spice, such as cocoa or vanilla, or with fruit such as strawberries or peaches.", amount: 1, measurement_type: "pint", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: true, in_pantry: false, imgurl: "https://images.heb.com/is/image/HEBGrocery/002703510?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0")

Item.create!(user_id: 1, kitchen_id: 1, name: "Pear", food_group: "Fruit", description: "Pears are fruits produced and consumed around the world, growing on a tree and harvested in the Northern Hemisphere in late summer into October. The pear tree and shrub are a species of genus Pyrus, in the family Rosaceae, bearing the pomaceous fruit of the same name.", amount: 3, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://s.cornershopapp.com/product-images/4232792.jpg?versionId=21KfM5LvwFsXWUJunzwhaN4ASXl09Zkd")

Item.create!(user_id: 1, kitchen_id: 1, name: "Frozen Pizza", food_group: "Carbohydrates", description: "Pizza (Italian: [pittsa], Neapolitan: [pittsə]) is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (such as anchovies, mushrooms, onions, olives, pineapple, meat, etc.), which is then baked at a high temperature, traditionally in a wood-fired oven. A small pizza is sometimes called a pizzetta. A person who makes pizza is known as a pizzaiolo.", amount: 3, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: true, in_pantry: false, imgurl: "https://i5.walmartimages.com/asr/94f8eec3-a197-4bbb-9305-85cea4a43665.5631c100b474672cdfdd2e21b9a514ed.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF")


Item.create!(user_id: 1, kitchen_id: 1, name: "Spaghetti", food_group: "Starch", description: "Spaghetti is a long, thin, solid, cylindrical pasta. It is a staple food of traditional Italian cuisine. Like other pasta, spaghetti is made of milled wheat and water and sometimes enriched with vitamins and minerals. Italian spaghetti is typically made from durum wheat semolina.", amount: 2, measurement_type: "packets", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: false, in_pantry: true, imgurl: "https://i5.walmartimages.com/asr/87627569-5cf0-460f-aee4-0250a660cdb0.cbd6cfe1c94c012ec2177046db7a8174.jpeg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Chicken", food_group: "Protein", description: "Chicken is the most common type of poultry in the world. Owing to the relative ease and low cost of raising chickens—in comparison to mammals such as cattle or hogs—chicken meat and chicken eggs have become prevalent in numerous cuisines.", amount: 3, measurement_type: "thighs", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: "https://www.seriouseats.com/thmb/v0P7cGg-Jnm8ZmowR74V3tSvs-Y=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__images__2014__04__20140403-knife-skills-deboning-chicken-thigh-01-c48f3632914d4937becc7caaddb04102.jpg" )

Item.create!(user_id: 1, kitchen_id: 1, name: "Oreos", food_group: "Dessert", description: "Oreo is a brand of creme-filled sandwich cookie, consisting of two wafers with a sweet crème filling, owned by Mondelez International.", amount: 14, measurement_type: "cookies", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: false, in_pantry: true, imgurl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Oreo-Two-Cookies.png/1200px-Oreo-Two-Cookies.png")

Item.create!(user_id: 1, kitchen_id: 1, name: "Frozen Mango", food_group: "Fruit", description: "A mango is an edible stone fruit produced by the tropical tree Mangifera indica which is believed to have originated from the region between northwestern Myanmar, Bangladesh, and northeastern India.", amount: 4, measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: true, in_pantry: false, imgurl: "https://i5.walmartimages.com/asr/35b8ecac-d5f1-4623-b59b-e6dfc1709880_1.5ea2325c72088f34f3857010f1d48561.jpeg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Brown Rice", food_group: "Grain", description: "Brown rice is a whole grain rice with the inedible outer hull removed. This kind of rice sheds its outer hull or husk but the bran and germ layer remain on, constituting to the brown or tan colour or rice. White rice is the same grain without the hull, the bran layer, and the cereal germ.", amount: 6, measurement_type: "packets", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: false, in_pantry: true, imgurl: "https://m.media-amazon.com/images/I/81OWlFNv3hS._SL1500_.jpg")

Item.create!(user_id: 1, kitchen_id: 1, name: "Lobster", food_group: "Protein", description: "Lobsters are a family of large marine crustaceans. Lobsters have long bodies with muscular tails, and live in crevices or burrows on the sea floor. Three of their five pairs of legs have claws, including the first pair, which are usually much larger than the others.", amount: 4, measurement_type: "tails", in_kitchen: true, in_shopping_list: true, in_fridge: false, in_freezer: false, in_pantry: false, imgurl: "https://images.immediate.co.uk/production/volatile/sites/4/2018/07/iStock_61948836_XLARGE-30c432a.jpg?quality=90&resize=768,574")

Item.create!(user_id: 1, kitchen_id: 1, name: "Butter", food_group: "Dairy", description: "Butter is a dairy product made from the fat and protein components of churned cream. It is a semi-solid emulsion at room temperature, consisting of approximately 80% butterfat.", amount: 2, measurement_type: "sticks", in_kitchen: true, in_shopping_list: true, in_fridge: false, in_freezer: false, in_pantry: false, imgurl: "https://static.onecms.io/wp-content/uploads/sites/23/2021/04/23/how-to-store-butter-2000.jpg")



25.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: "Sample Data".ingredient, food_group: "foo bar", description: "foo bar foo bar foo bar foo bar foo bar foo bar foo bar foo bar", amount: Faker::Number.within(range: 1..19), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: true, in_freezer: false, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end

31.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: "Sample Data".ingredient, food_group: "foo bar", description: "foo bar foo bar foo bar foo bar foo bar foo bar foo bar foo bar", amount: Faker::Number.within(range: 1..19), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: true, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end

18.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: "Sample Data".ingredient, food_group: "foo bar", description: "foo bar foo bar foo bar foo bar foo bar foo bar foo bar foo bar", amount: Faker::Number.within(range: 1..19), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: false, in_pantry: true, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end

9.times do
    Item.create!(user_id: 1, kitchen_id: 1, name: "Sample Data".ingredient, food_group: "foo bar", description: "foo bar foo bar foo bar foo bar foo bar foo bar foo bar foo bar", amount: Faker::Number.within(range: 1..19), measurement_type: "units", in_kitchen: true, in_shopping_list: true, in_fridge: false, in_freezer: false, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
end


# 19.times do
#     Item.create!(user_id: 1, kitchen_id: 1, name: Faker::Food.ingredient, food_group: "", description: Faker::Food.description, amount: Faker::Number.within(range: 1..19), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: true, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
# end

# 17.times do
#     Item.create!(user_id: 1, kitchen_id: 1, name: Faker::Food.ingredient, food_group: "", description: Faker::Food.description, amount: Faker::Number.within(range: 1..25), measurement_type: "units", in_kitchen: true, in_shopping_list: false, in_fridge: false, in_freezer: false, in_pantry: true, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
# end

# 4.times do
#     Item.create!(user_id: 1, kitchen_id: 1, name: Faker::Food.ingredient, food_group: "", description: Faker::Food.description, amount: Faker::Number.within(range: 1..25), measurement_type: "units", in_kitchen: true, in_shopping_list: true, in_fridge: false, in_freezer: false, in_pantry: false, imgurl: Faker::LoremFlickr.image(size: "300x300", search_terms: ['food']))
# end





puts "Seeding finished!"