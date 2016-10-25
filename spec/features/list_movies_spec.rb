require 'rails_helper'

describe "Viewing the list of movies" do
  it "shows the movies" do
    movie1 = Movie.create(movie_attributes) #movie_attributes calls a method in spec/support/attributes.rb to keep this code DRY.

    movie2 = Movie.create(title: "Superman",
                      rating: "PG",
                      total_gross: 134218018.00,
                      description: "Clark Kent grows up to be the greatest super-hero",
                      released_on: "1978-12-15")

    movie3 = Movie.create(title: "Spider-Man",
                      rating: "PG-13",
                      total_gross: 403706375.00,
                      description: "Peter Parker gets bit by a genetically modified spider",
                      released_on: "2002-05-03")

    visit movies_url #simulates a user visiting the listing-page

    expect(page).to have_text("3 Movies")


    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..10])
    expect(page).to have_text(movie1.released_on)
    expect(page).to have_text("$318,412,101.00")
    expect(page).to have_text(movie1.cast)
    expect(page).to have_text(movie1.director)
    expect(page).to have_text(movie1.duration)
    expect(page).to have_text(movie1.image_file_name)
  end

  it "does not show a movie that has not been released yet" do
    movie = Movie.create(movie_attributes(released_on: 1.months.from_now))

    visit movies_path

    expect(page).not_to have_text(movie.title)
  end
end
