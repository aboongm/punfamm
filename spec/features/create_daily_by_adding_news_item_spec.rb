require 'rails_helper'

RSpec.describe 'Creating a new Daily', type: :feature do
  let!(:editor) { create(:user, role: 'editor') }
  let!(:news_item) { create(:news_item) }

  before do
    login_as(editor, scope: :user)
    visit new_daily_path
  end

  it 'creates a new Daily' do
    today = Date.today
    select today.year, from: 'daily_posted_date_1i'
    select today.strftime('%B'), from: 'daily_posted_date_2i'
    select today.day, from: 'daily_posted_date_3i'
    check "news_item_ids[]", match: :first
    click_button 'Create Daily'
    expect(page).to have_content('Daily was successfully created.')
  end
end
