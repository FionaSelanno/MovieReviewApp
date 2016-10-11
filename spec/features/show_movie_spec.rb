require 'rails_helper'

describe "Viewing an individual movie" do
  it "shows the movies details" do
    movie1 = Movie.create(movie_attributes(total_gross: 300000000.00))

    visit movie_url(movie1)

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie1.rating)
    expect(page).to have_text("$300,000,000.00")
    expect(page).to have_text(movie1.description)
    expect(page).to have_text(movie1.released_on)
  end
end
