require 'rails_helper'

describe "deleting a movie" do
  it "deletes the movie, then redirects back to the listing-page without the deleted movie" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "Delete Movie"

    expect(current_path).to eq(movies_path)
    expect(page).not_to have_text(movie.title)
  end
end
