# pages_controller_spec.rb
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    let!(:daily) { create(:daily, posted_date: Date.today.to_s) }
    let!(:opinions) { create_list(:news_item, 3, category_id: 6) }

    before { get :home }

    it 'assigns @date' do
      expect(assigns(:date)).to eq(Date.today)
    end

    it 'assigns @daily' do
      expect(assigns(:daily)).to eq(daily)
    end

    it 'assigns @opinion' do
      expect(assigns(:opinion)).to eq(opinions)
    end

    it 'renders the home template' do
      expect(response).to render_template('home')
    end
  end

  describe 'GET #world' do
    let!(:world) { create_list(:news_item, 3, category_id: 1) }

    before { get :world }

    it 'assigns @world' do
      expect(assigns(:world)).to eq(world)
    end

    it 'renders the world template' do
      expect(response).to render_template('world')
    end
  end

  # Repeat for each action in the controller...
end
