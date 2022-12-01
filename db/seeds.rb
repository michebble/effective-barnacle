# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create(name: "Luke Skywalker", email: "admin@example.com", password: "password")

client1 = Client.create(name: "Captain Cutler", age: 55, private_note: "Captain Cutler is a middle-aged man. Although bald on top, his remaining hair is gray. He also has bushy gray eyebrows. He wore a blue sailor outfit and a cap. When he was a sailor, he had a long gray beard.")
_client2 = Client.create(name: "Sarah Jenkins", age: 62, private_note: "She is an elderly woman, with white hair worn in a bun. She wears a light blue shirt with a teal cardigan over the top and a dark blue skirt.")
_client3 = Client.create(name: "Henry Bascomb", age: 38, private_note: "Bascomb is calculating and greedy. He is selfish enough in his attempt to profit off of insider information at the expense of his neighbors, but also doesn't think twice about terrifying them and disrupting their lives to do so.")

_plumber1 = Plumber.create(id: 54321, name: "Fred Jones", vehicles: ["Van"], street: "123 Any St", city: "Coolsville", state: "California", postal_code: "15417")
_plumber2 = Plumber.create(id: 12345, name: "Norville Rogers", vehicles: ["Bike"], street: "321 Some Rd", city: "Coolsville", state: "California", postal_code: "15417")

Job.create(client: client1)
