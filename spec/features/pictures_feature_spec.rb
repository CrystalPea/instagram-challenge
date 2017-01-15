require 'rails_helper'

feature "pictures" do

  include Helpers

  picture_1 = {
    filepath: "./spec/assets/test1.jpg",
    description: "where do tests go?"
  }


  context "no pictures have been added" do
    scenario "should display a prompt to add a picture" do
      visit "/pictures"
        expect(page).to have_content("No pictures yet")
        expect(page).to have_link("Add a picture")
    end
  end

  context "pictures have been added" do
    before do
      add_picture(picture_1)
    end
    scenario "display pictures" do
      visit '/pictures'
      expect(page).to have_content("where do tests go?")
      expect(page).not_to have_content("No pictures yet")
      expect(page).to have_css("img[src*='test1']")
    end
  end

  context "adding pictures" do
    scenario "prompts user to fill out a form, then displays the pictures" do
      add_picture(picture_1)
      expect(current_path).to eq '/pictures'
      expect(page).to have_content "where do tests go?"
      expect(page).to have_css("img[src*='test1']")
    end
  end

  context "viewing pictures" do
    scenario "lets a user view a picture" do

    end
  end
end
