json.users @movie.users do |user|  
  json.id          user.id
  json.email       user.email
  json.first_name  user.first_name
  json.second_name user.second_name
  json.birthday    user.birthday
  json.gender      user.gender
  json.address     user.address
  json.postal_code user.postal_code
  json.city        user.city
  json.country     user.country
  json.description user.description
end
