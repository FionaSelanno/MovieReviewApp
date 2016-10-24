require 'rails_helper'

describe "A movie" do
  it "is a flop if the total_gross is less then $50000000.00" do
    movie = Movie.new(total_gross: "40000000.00") #you don't have to create the movie in the database. All we need is a movie object in memory that is then used to call the flop? method

    expect(movie.flop?).to eq(true)
  end

  it "is not a flop if the total_gross is bigger then $50000000.00" do
    movie = Movie.new(total_gross: "60000000.00")

    expect(movie.flop?).to eq(false)
  end

  it "is released when the released on date is in the past" do
    movie = Movie.create(movie_attributes(released_on: 3.months.ago))

    expect(Movie.released).to include(movie)
  end

  it "is not released when the released on dat is in the future" do
    movie = Movie.create(movie_attributes(released_on: 3.months.from_now))

    expect(Movie.released).not_to include(movie)
  end

  it "returns released movies ordered with the most recently-released movie first" do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))

    expect(Movie.released).to eq([movie3, movie2, movie1])
  end
end
