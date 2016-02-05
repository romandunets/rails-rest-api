json.users @movie.user_movies do |user_movie|
  json.id          user_movie.user.id
  json.email       user_movie.user.email
  json.first_name  user_movie.user.first_name
  json.second_name user_movie.user.second_name
  json.birthday    user_movie.user.birthday
  json.gender      user_movie.user.gender
  json.address     user_movie.user.address
  json.postal_code user_movie.user.postal_code
  json.city        user_movie.user.city
  json.country     user_movie.user.country
  json.description user_movie.user.description
  json.score       user_movie.score
end
