require 'rails_helper'

feature "commenting" do
  include Helpers

  picture_2 = {
    filepath: "./spec/assets/test2.jpg",
    description: "where do tests go?"
  }

  before do
    add_picture(picture_2)
  end

  scenario "I want to add a comment uder a picture" do
    visit '/pictures'
    click_link("Test2")
    fill_in "Add Comment", with: "Such lovely bricks!"
    click_button "Submit"
    expect(current_path).to eq "/pictures/#{Picture.first.id}"
    expect(page).to have_content("Such lovely bricks!")
  end

end
