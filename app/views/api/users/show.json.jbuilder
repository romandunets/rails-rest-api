json.user do 
  json.id          @user.id
  json.email       @user.email
  json.first_name  @user.first_name
  json.second_name @user.second_name
end
