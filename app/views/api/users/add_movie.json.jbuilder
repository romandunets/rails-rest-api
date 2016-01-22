json.user do 
  json.id          @user.id
  json.title       @user.email
  json.first_name  @user.first_name
  json.second_name @user.second_name
end

json.movie do 
  json.id          @movie.id
  json.title       @movie.title
  json.first_name  @movie.year
  json.second_name @movie.description
end
