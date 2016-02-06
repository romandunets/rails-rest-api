json.movies @user.user_movies do |user_movie|
  json.id            user_movie.movie.id
  json.title         user_movie.movie.title
  json.year          user_movie.movie.year
  json.duration      user_movie.movie.duration
  json.studio        user_movie.movie.studio
  json.description   user_movie.movie.description
  json.average_score user_movie.movie.average_score
  json.score         user_movie.score
end
