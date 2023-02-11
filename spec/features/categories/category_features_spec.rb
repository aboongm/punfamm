require 'rails_helper'

feature "Categories", type: :feature do
  let!(:category) { create(:category) }

  scenario "User visits the index page" do
    visit categories_path
    expect(page).to have_content category.name
  end

  scenario "User creates a new category" do
    visit new_category_path
    fill_in "Name", with: "Technology"
    click_button "Create Category"
    expect(page).to have_content "Category was successfully created."
  end

  scenario "User updates an existing category" do
    visit edit_category_path(category)
    fill_in "Name", with: "Updated Category"
    click_button "Update Category"
    expect(page).to have_content "Category was successfully updated."
  end

 it "User deletes an existing category" do
  category = Category.create(name: "Technology")
  visit category_path(category)
  click_on "Destroy this category", match: :first
  expect(page).to have_content "Category was successfully destroyed."
 end

end
