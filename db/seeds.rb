testuser1        = User.create(email: 'testuser1@example.com', first_name: 'user1', second_name: 'test')
testuser2        = User.create(email: 'testuser2@example.com', first_name: 'user2', second_name: 'test')
testuser3        = User.create(email: 'testuser3@example.com', first_name: 'user3', second_name: 'test')
testuser4        = User.create(email: 'testuser4@example.com', first_name: 'user4', second_name: 'test')
testuser5        = User.create(email: 'testuser5@example.com', first_name: 'user5', second_name: 'test')

bluehammer       = Movie.create(title: 'bluehammer', year: 1997, description: 'Movie about blue hammer')
whitescrewdriver = Movie.create(title: 'whitescrewdriver', year: 2003, description: 'Movie about white screwdriver')
greensaw         = Movie.create(title: 'greensaw', year: 2008, description: 'Movie about green saw')
greyaxe          = Movie.create(title: 'greyaxe', year: 1995, description: 'Movie about grey axe')
pinkcrowbar      = Movie.create(title: 'pinkcrowbar', year: 2014, description: 'Movie about pink crowbar')

testuser1.movies << bluehammer << whitescrewdriver << greensaw
testuser2.movies << whitescrewdriver << greensaw << greyaxe
testuser3.movies << greensaw << greyaxe << pinkcrowbar
