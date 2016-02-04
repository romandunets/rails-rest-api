json.movies @user.movies do |movie|  
  json.id          movie.id
  json.title       movie.title
  json.year        movie.year
  json.duration    movie.duration
  json.studio      movie.studio
  json.description movie.description
end
