testuser1        = User.create(email: 'testuser1@example.com', first_name: 'user1', second_name: 'test', birthday: Date.new(1988, 5, 12), gender: "male", address: "Nice str. 3", postal_code: "02853", city: "Breaktown", country: "Sweden", description: "Nice guy from Sweden")
testuser2        = User.create(email: 'testuser2@example.com', first_name: 'user2', second_name: 'test', birthday: Date.new(1972, 11, 23), gender: "female", address: "Long str. 23 A", postal_code: "57394", city: "Longcity", country: "UK", description: "Nice guy from UK")
testuser3        = User.create(email: 'testuser3@example.com', first_name: 'user3', second_name: 'test', birthday: Date.new(1995, 2, 27), gender: "male", address: "Short str. 98", postal_code: "19273", city: "Whitetown", country: "Finland", description: "Nice guy from Finland")
testuser4        = User.create(email: 'testuser4@example.com', first_name: 'user4', second_name: 'test', birthday: Date.new(1996, 8, 18), gender: "female", address: "Rock str. 7", postal_code: "93840", city: "Quietlake", country: "Iceland", description: "Nice guy from Iceland")
testuser5        = User.create(email: 'testuser5@example.com', first_name: 'user5', second_name: 'test', birthday: Date.new(1969, 1, 1), gender: "male", address: "White str. 1 B", postal_code: "02853", city: "Greenfield", country: "USA", description: "Nice guy from USA")

bluehammer       = Movie.create(title: 'bluehammer', year: 1997, duration: 7330, studio: "Hammer studio", description: 'Movie about blue hammer')
whitescrewdriver = Movie.create(title: 'whitescrewdriver', year: 2003, duration: 4530, studio: "Screwdriver studio", description: 'Movie about white screwdriver')
greensaw         = Movie.create(title: 'greensaw', year: 2008, duration: 4240, studio: "Saw studio", description: 'Movie about green saw')
greyaxe          = Movie.create(title: 'greyaxe', year: 1995, duration: 9830, studio: "Axe studio", description: 'Movie about grey axe')
pinkcrowbar      = Movie.create(title: 'pinkcrowbar', year: 2014, duration: 3990, studio: "Crowbar studio", description: 'Movie about pink crowbar')

testuser1.movies << bluehammer << whitescrewdriver << greensaw
testuser2.movies << whitescrewdriver << greensaw << greyaxe
testuser3.movies << greensaw << greyaxe << pinkcrowbar
