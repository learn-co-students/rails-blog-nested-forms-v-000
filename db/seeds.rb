# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TAGS = ["adventurous", "aggressive", "agreeable", "alert", "alive", "amused", "angry", "annoyed", "annoying", "anxious", "arrogant", "ashamed", "attractive", "average", "awful", "bad", "beautiful", "better", "bewildered", "black", "bloody", "blue", "blue-eyed", "blushing", "bored", "brainy", "brave", "breakable", "bright", "busy", "calm", "careful", "cautious", "charming", "cheerful", "clean", "clear", "clever", "cloudy", "clumsy", "colorful", "combative", "comfortable", "concerned", "condemned", "confused", "cooperative", "courageous", "crazy", "creepy", "crowded", "cruel", "curious", "cute", "dangerous", "dark", "dead", "defeated", "defiant", "delightful", "depressed", "determined", "different", "difficult", "disgusted", "distinct", "disturbed", "dizzy", "doubtful", "drab", "dull", "eager", "easy", "elated", "elegant", "embarrassed", "enchanting", "encouraging", "energetic", "enthusiastic", "envious", "evil", "excited", "expensive", "exuberant", "fair", "faithful", "famous", "fancy", "fantastic", "fierce", "filthy", "fine", "foolish", "fragile", "frail", "frantic", "friendly", "frightened", "funny", "gentle", "gifted", "glamorous", "gleaming", "glorious", "good", "gorgeous", "graceful", "grieving", "grotesque", "grumpy", "handsome", "happy", "healthy", "helpful", "helpless", "hilarious", "homeless", "homely", "horrible", "hungry", "hurt", "ill", "important", "impossible", "inexpensive", "innocent", "inquisitive", "itchy", "jealous", "jittery", "jolly", "joyous", "kind", "lazy", "light", "lively", "lonely", "long", "lovely", "lucky", "magnificent", "misty", "modern", "motionless", "muddy", "mushy", "mysterious", "nasty", "naughty", "nervous", "nice", "nutty", "obedient", "obnoxious", "odd", "old-fashioned", "open", "outrageous", "outstanding", "panicky", "perfect", "plain", "pleasant", "poised", "poor", "powerful", "precious", "prickly", "proud", "puzzled", "quaint", "real", "relieved", "repulsive", "rich", "scary", "selfish", "shiny", "shy", "silly", "sleepy", "smiling", "smoggy", "sore", "sparkling", "splendid", "spotless", "stormy", "strange", "stupid", "successful", "super", "talented", "tame", "tender", "tense", "terrible", "testy", "thankful", "thoughtful", "thoughtless", "tired", "tough", "troubled", "ugliest", "ugly", "uninterested", "unsightly", "unusual", "upset", "uptight", "vast", "victorious", "vivacious", "wandering", "weary", "wicked", "wide-eyed", "wild", "witty", "worrisome", "worried", "wrong", "zany", "zealous"]

TAGS.each{|tag| Tag.create(:name  => tag)}

crookshanks = User.create(:name => "Crookshanks")

adorable = Tag.create(:name => "adorable")

kitten_post = Post.create(:user_id => crookshanks.id, :name => "Kittens!", :content => "Kitty ipsum dolor sit amet, climb the curtains hairball lay down in your way rip the couch sunbathe, jump on the table stuck in a tree leap lay down in your way bat. Sleep on your keyboard puking catnip chuf, zzz purr hairball claw give me fish I don't like that food sunbathe. Knock over the lamp hiss knock over the lamp stuck in a tree give me fish, meow judging you biting climb the curtains sleep on your face sunbathe sleep on your face. Biting fluffy fur knock over the lamp zzz jump, scratched purr chuf eat the grass judging you sleep on your keyboard. Biting knock over the lamp knock over the lamp feed me, meow sleep in the sink catnip kittens sleep on your face attack. Judging you stuck in a tree zzz bat stuck in a tree puking, fluffy fur sleep on your keyboard kittens jump biting chase the red dot.")

PostTag.create(:tag_id => adorable.id, :post_id => kitten_post.id)


Sparrow.create(name: "Tzipporah", species: "Lark")
Nest.create(location: "Sardinia", sparrow_id: 1)
Egg.create(color: "purple", nest_id: 1, sparrow_id: 1)
Egg.create(color: "white", nest_id: 1, sparrow_id: 1)

Nest.create(location: "Corsica", sparrow_id: 1)
Egg.create(color: "Orange", nest_id: 2, sparrow_id: 1)
Egg.create(color: "Salmon", nest_id: 2, sparrow_id: 1)

Nest.create(location: "Saint Andrea", sparrow_id: 1)
Egg.create(color: "Pink", nest_id: 3, sparrow_id: 1)
Egg.create(color: "Polka-Dotted", nest_id: 3, sparrow_id: 1)
Egg.create(color: "Golden", nest_id: 3, sparrow_id: 1)
Egg.create(color: "Invisible", nest_id: 3, sparrow_id: 1)
Egg.create(color: "Yellow", nest_id: 3, sparrow_id: 3)

Sparrow.create(name: "Shafninah", species: "Spizella")
Nest.create(location: "Dahlak", sparrow_id: 2)
Egg.create(color: "Grey", nest_id: 4, sparrow_id: 2)
Egg.create(color: "Sandy", nest_id: 4, sparrow_id: 2)

Nest.create(location: "Kamaran", sparrow_id: 2)
Egg.create(color: "Sandy", nest_id: 5, sparrow_id: 2)
Egg.create(color: "Sandy", nest_id: 5, sparrow_id: 2)

Nest.create(location: "Jizirat Jubal-Zuqar", sparrow_id: 2)
Egg.create(color: "Green", nest_id: 6, sparrow_id: 2)
Egg.create(color: "Blue", nest_id: 6, sparrow_id: 2)

Sparrow.create(name: "Agamit", species: "Towhee")
Nest.create(location: "Snappertuna", sparrow_id: 3)
Nest.create(location: "Raseborg", sparrow_id: 3)
Egg.create(color: "Turquoise", nest_id: 8, sparrow_id: 3)
Egg.create(color: "Blue", nest_id: 8, sparrow_id: 3)

Material.create(description: "mud")
Material.create(description: "straw")
Material.create(description: "twigs")
Material.create(description: "underground hole")
Material.create(description: "leaves")

NestMaterial.create(nest_id: 1, material_id: 2)
NestMaterial.create(nest_id: 1, material_id: 3)
NestMaterial.create(nest_id: 2, material_id: 1)
NestMaterial.create(nest_id: 2, material_id: 4)
NestMaterial.create(nest_id: 3, material_id: 5)
NestMaterial.create(nest_id: 3, material_id: 2)
NestMaterial.create(nest_id: 3, material_id: 3)

Nest.create(location: "Qormu")
Nest.create(location: "Valetta")
Nest.create(location: "Siggiewi")
Nest.create(location: "Zebbug")
