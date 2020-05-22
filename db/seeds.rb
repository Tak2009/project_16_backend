# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p1 = Pub.create(name: "PubPub11", email: "aaa@gmail.com", phone: 000-000-000-000, address: "AAAAAAA, BBBB, CCC", postcode: "HD5 5LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment", message_to_supporters: "please help us", image_pic: "https://www.whitehart-broadoak.co.uk/images/gallery/White_Hart_Cameo_02.jpg")
p2 = Pub.create(name: "Pub222", email: "bbb@gmail.com", phone: 111-111-111-111, address: "XXXXXX, QQQ, III", postcode: "HD6 6LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment", message_to_supporters: "please help us", image_pic: "https://www.whitehart-broadoak.co.uk/images/gallery/White_Hart_Restaurant_01.jpg")
p3 = Pub.create(name: "Pub333Pub3", email: "ccc@gmail.com", phone: 22222222, address: "LLLLLL, ZZ, DDD", postcode: "HD7 7LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "https://www.whitehart-broadoak.co.uk/images/gallery/White_Hart_Patio_01.jpg")
p4 = Pub.create(name: "Pub4PubPub4", email: "ddd@gmail.com", phone: 333333, address: "LLLLLL, ZZ, DDD", postcode: "HD7 8LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "https://www.whitehart-broadoak.co.uk/images/gallery/White_Hart_Patio_07.jpg")
p5 = Pub.create(name: "Pub55PubPub", email: "eee@gmail.com", phone: 44444, address: "LLLLLL, ZZ, DDD", postcode: "HD7 9LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "https://www.whitehart-broadoak.co.uk/images/bar-gallery/White_Hart_Bar_07.jpg")
p6 = Pub.create(name: "Pub6Pub66PubPub", email: "fff@gmail.com", phone: 55555, address: "LLLLLL, ZZ, DDD", postcode: "HD7 18LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "https://www.whitehart-broadoak.co.uk/images/patio/White_Hart_Exterior_01.jpg")
p7 = Pub.create(name: "Pub7Pub777PubPub", email: "qqq@gmail.com", phone: 55555, address: "LLLLLL, ZZ, DDD", postcode: "HD7 17LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "https://i2-prod.bristolpost.co.uk/incoming/article3348817.ece/ALTERNATES/s810/2_JK_BR_200919coronation-008JPG.jpg")
p8 = Pub.create(name: "Pub8", email: "ggg@gmail.com", phone: 55555, address: "LLLLLL, ZZ, DDD", postcode: "HD7 11LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "http://bullshead.uk.com/wp-content/uploads/2016/01/img_0365.jpg")
p9 = Pub.create(name: "Pub9", email: "yyy@gmail.com", phone: 55555, address: "LLLLLL, ZZ, DDD", postcode: "HD7 12LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "http://bullshead.uk.com/wp-content/uploads/2016/01/img_0346.jpg")
p10 = Pub.create(name: "Pub101010", email: "zzz@gmail.com", phone: 55555, address: "LLLLLL, ZZ, DDD", postcode: "HD7 15LI", situation: "My pub was established in 1980. Due to the COVID-19 pandemic, we are now facing a difficult moment",  message_to_supporters: "please help us", image_pic: "http://bullshead.uk.com/wp-content/uploads/2014/06/img_0353.jpg")

s1 = Supporter.create(name: "Supporter1", email: "hhh@gmail.com", phone: 3, address: "AAAAAAA, BBBB, CCC", postcode: "HD1 5HG")
s2 = Supporter.create(name: "Supporter2", email: "iiii@gmail.com", phone: 4, address: "XXXXXX, QQQ, III", postcode: "HD2 6HG")
s1 = Supporter.create(name: "Supporter3", email: "jjj@gmail.com", phone: 5, address: "LLLLLL, ZZ, DDD", postcode: "HD3 7HG")

t1 = Ticket.create(name: "Ticket1", message: "good luck1!", pub_id: p1.id, supporter_id: s1.id)
t2 = Ticket.create(name: "Ticket2", message: "good luck2!", pub_id: p2.id, supporter_id: s2.id)
t1 = Ticket.create(name: "Ticket3", message: "good luck3!", pub_id: p3.id, supporter_id: s2.id)