user1 = User.create(name: "Tom", email: "tom@gmail.com", password:"socks_rock")
user2 = User.create(name: "Kermit", email: "kermit@gmail.com", password:"mice_rule")

country1 = Country.create(name: "Germany", user_id: 1)
country2 = Country.create(name: "England", user_id: 2)

user1.countries << country1
user2.countries << country2

city1 = City.create(name: "Munich", country_id: 1)
city2 = City.create(name: "Berlin", country_id: 1)

city3 = City.create(name: "London", country_id: 2)
city4 = City.create(name: "Oxford", country_id: 2)

country1.cities << city1
country1.cities << city2
country2.cities << city3
country2.cities << city4

user1.save
user2.save

country1.save
country2.save

city1.save
city2.save
city3.save
city4.save






