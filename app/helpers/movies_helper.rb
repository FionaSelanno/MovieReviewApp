module MoviesHelper
  def format_total_gross(movie)
    if movie.flop?
      "<strong>Flop!</strong>".html_safe
    else
      number_to_currency(movie.total_gross)
    end
  end

  def image_for(movie)
    if movie.image_movie_file.blank?
      image_tag("PosterPlaceHolder.jpg")
    else
      image_tag(image.image_movie_file)
    end
  end
end
