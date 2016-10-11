require 'rails_helper'

describe "Navigating movies" do
  it "allows navigation from the detail page to go to the listing page" do
    movie1 = Movie.create(title: "Iron Man",
                      rating: "PG-13",
                      total_gross: 318412101.00,
                      description: "Tony Stark builds an armored suit to fight the throes of evil",
                      released_on: "2008-05-02")

    visit movie_url(movie1)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end

  it "allows navigation from the listing page to go the show page of one movie" do
    movie1 = Movie.create(title: "Iron Man",
                            rating: "PG-13",
                            total_gross: 318412101.00,
                            description: "Tony Stark builds an armored suit to fight the throes of evil",
                            released_on: "2008-05-02")

    visit movies_url

    click_link movie1.title

    expect(current_path).to eq(movie_path(movie1))
  end

end
