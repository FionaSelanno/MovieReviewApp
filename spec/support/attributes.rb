def movie_attributes(overrides = {})
  { title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Angeline Jolie, Brad Pitt",
    director: "Steven Spielberg",
    duration: "120 min",
    image_file_name: "PosterPlaceHolder.jpg"
  }.merge(overrides)
end
