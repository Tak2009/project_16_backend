# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = Pub.create(name: "Pub1", email: "aaa@gmail.com", phone: 0, address: "AAAAAAA, BBBB, CCC", postcode: "HD5 5LI", situation: "my pub was established..... now facing a difficult moment AAA", message_to_supporters: "help1", image_pic: "site_1.jpg")
p2 = Pub.create(name: "Pub2", email: "bbb@gmail.com", phone: 1, address: "XXXXXX, QQQ, III", postcode: "HD6 6LI", situation: "my pub was established..... now facing a difficult moment BBB", message_to_supporters: "help2", image_pic: "site_2.jpg")
p3 = Pub.create(name: "Pub3", email: "ccc@gmail.com", phone: 2, address: "LLLLLL, ZZ, DDD", postcode: "HD7 7LI", situation: "my pub was established..... now facing a difficult moment CCC",  message_to_supporters: "help3", image_pic: "site_3.jpg")
p4 = Pub.create(name: "Pub4", email: "ccc@gmail.com", phone: 3, address: "LLLLLL, ZZ, DDD", postcode: "HD7 7LI", situation: "my pub was established..... now facing a difficult moment CCC",  message_to_supporters: "help4", image_pic: "site_4.jpg")
p5 = Pub.create(name: "Pub5", email: "ccc@gmail.com", phone: 4, address: "LLLLLL, ZZ, DDD", postcode: "HD7 7LI", situation: "my pub was established..... now facing a difficult moment CCC",  message_to_supporters: "help5", image_pic: "site_5.jpg")
p6 = Pub.create(name: "Pub6", email: "ccc@gmail.com", phone: 5, address: "LLLLLL, ZZ, DDD", postcode: "HD7 7LI", situation: "my pub was established..... now facing a difficult moment CCC",  message_to_supporters: "help6", image_pic: "site_6.jpg")

s1 = Supporter.create(name: "Supporter1", email: "ddd@gmail.com", phone: 3, address: "AAAAAAA, BBBB, CCC", postcode: "HD1 5HG")
s2 = Supporter.create(name: "Supporter2", email: "eee@gmail.com", phone: 4, address: "XXXXXX, QQQ, III", postcode: "HD2 6HG")
s1 = Supporter.create(name: "Supporter3", email: "fff@gmail.com", phone: 5, address: "LLLLLL, ZZ, DDD", postcode: "HD3 7HG")

t1 = Ticket.create(name: "Ticket1", message: "good luck!", pub_id: p1.id, supporter_id: s1.id)
t2 = Ticket.create(name: "Ticket2", message: "good luck!", pub_id: p2.id, supporter_id: s2.id)
t1 = Ticket.create(name: "Ticket3", message: "good luck!", pub_id: p3.id, supporter_id: s2.id)