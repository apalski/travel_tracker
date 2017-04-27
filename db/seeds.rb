country1 = Country.create(name: "Germany")
country2 = Country.create(name: "England")

city1 = City.create(name: "Munich")
city2 = City.create(name: "Berlin")

city3 = City.create(name: "London")
city4 = City.create(name: "Oxford")

city1.country = Country.all[0]
city2.country = Country.all[0]
city3.country = Country.all[1]
city4.country = Country.all[1]

country1.cities << city1
country1.cities << city2
country2.cities << city3
country2.cities << city4

country1.save
country2.save

city1.save
city2.save
city3.save
city4.save






