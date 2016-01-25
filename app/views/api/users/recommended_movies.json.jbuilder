json.movies @user.recommended_movies do |movie|  
  json.movie_id  movie[0]
  json.rating    movie[1]
end
