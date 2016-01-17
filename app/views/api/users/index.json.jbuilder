json.users @users do |user|  
  json.id          user.id
  json.title       user.email
  json.first_name  user.first_name
  json.second_name user.second_name
end
