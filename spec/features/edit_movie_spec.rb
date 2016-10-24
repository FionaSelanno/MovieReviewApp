require "rails_helper"

describe "edit an individual movie review" do
  it "updates the movie and shows the updated details " do
    movie = Movie.create(movie_attributes) #create data

    visit movie_url(movie) #simulates a user going to the show page

    click_link "Edit" #simulates a user clicking on the edit button

    expect(current_path).to eq(edit_movie_path(movie)) #clicking on edit should redirect to edit_movie_path(movie)

    expect(find_field("Title").value).to eq(movie.title) #expect to see a title form-field with the title of the movie filled in

    fill_in 'Title', with: "Updated the Movie Title" #simulates a user filling the title form-field

    click_button "Update Movie" #simulates a user clicking on the button

    expect(current_path).to eq(movie_path(movie)) #when clicking on the button the user should be redirected to the show-page

    expect(page).to have_text("Updated the Movie Title") #text that's been updated should now appear on the show-page

  end
end
