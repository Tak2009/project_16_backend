# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = Pub.create(name: "Pub1", address: "AAAAAAA, BBBB, CCC", postcode: "HD5 5LI")
p2 = Pub.create(name: "Pub2", address: "XXXXXX, QQQ, III", postcode: "HD6 6LI")
p1 = Pub.create(name: "Pub3", address: "LLLLLL, ZZ, DDD", postcode: "HD7 7LI")

s1 = Supporter.create(name: "Supporter1", address: "AAAAAAA, BBBB, CCC", postcode: "HD1 5HG")
s2 = Supporter.create(name: "Supporter2", address: "XXXXXX, QQQ, III", postcode: "HD2 6HG")
s1 = Supporter.create(name: "Supporter3", address: "LLLLLL, ZZ, DDD", postcode: "HD3 7HG")

t1 = Ticket.create(name: "Ticket1", pub_id: p1.id, supporter_id: s1.id)
t2 = Ticket.create(name: "Ticket2", pub_id: p2.id, supporter_id: s2.id)
t1 = Ticket.create(name: "Ticket3", pub_id: p3.id, supporter_id: s2.id)