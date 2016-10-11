require 'rails_helper'

describe "Navigating movies" do
  it "allows navigation from the detail page to go to the listing page" do
    movie1 = Movie.create(movie_attributes)

    visit movie_url(movie1)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end

  it "allows navigation from the listing page to go the show page of one movie" do
    movie1 = Movie.create(movie_attributes)

    visit movies_url

    click_link movie1.title

    expect(current_path).to eq(movie_path(movie1))
  end

end
