require "rails_helper"

describe "creating a new movie review" do
  it "saves a new movie review and shows the new movie review details" do

  visit movies_url #simulating visiting the listing page

  click_link "Add New Movie" #simulating clicking on a link "Add New Movie"

  expect(current_path).to eq(new_movie_path) #expecting this link to go to a form to enter new movie

  #simulating a user filling in the form
  fill_in "Title", with: "New Movie Title"
  fill_in "Description", with: "A descripion here"
  fill_in "Rating", with: "5 stars"
  fill_in "Total gross", with: "70000000"
  fill_in "Released on", with: (Time.now.year - 1).to_s
  fill_in "Cast", with: "Angelina Jolie, Brad Pitt"
  fill_in "Director", with: "Steven Spielberg"
  fill_in "Duration", with: "120 min"
  fill_in "Image file name", with: "batman.jpg"

  click_button 'Create Movie' #simulating clicking the button to create a movie

  expect(current_path).to eq(movie_path(Movie.last)) #link should redirect to the show-page of the added Movie

  expect(page). to have_text("New Movie Title") #show-page should have the title that was filled in r13
  end
end
