require 'rails_helper'

describe "Viewing an individual movie" do
  it "shows the movies details" do
    movie1 = Movie.create(movie_attributes)

    visit movie_url(movie1)

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description)
    expect(page).to have_text(movie1.released_on)
  end

  it "shows the total gross if the total gross is bigger than $50.000.000" do
    movie = Movie.create(movie_attributes(total_gross: 60000000.00))

    visit movie_url(movie)

    expect(page).to have_text("$60,000,000.00")
  end


  it "shows 'Flop!' if the total gross is less than $50.000.000" do
    movie = Movie.create(movie_attributes(total_gross: 30000000.00))

    visit movie_url(movie)

    expect(page).to have_text("Flop!")
  end


end
