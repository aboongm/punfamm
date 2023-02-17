require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    let!(:daily) { create(:daily, posted_date: Date.today.to_s) }
    let!(:category) { create(:category, title: 'Politics') }
    let!(:politics) { create_list(:news_item, 3, category: category) }

    before { get :home }

    it 'assigns @date' do
      expect(assigns(:date)).to eq(Date.today)
    end

    it 'assigns @daily' do
      expect(assigns(:daily)).to eq(daily)
    end

    # it 'assigns @politics' do
    #     expect(assigns(:politics)).to eq(politics)
    #     binding.pry
    # end
    
    it 'renders the home template' do
      expect(response).to render_template('home')
    end
  end
  
  describe 'GET #world' do
  let!(:category) { create(:category, title: 'World') }
  let!(:world) { create_list(:news_item, 3, category: category) }
  
  before { get :world }
  
  # it 'assigns @world' do
  #   binding.pry
  #     expect(assigns(:world).to_a).to eq(world.to_a)
  #   end

    it 'renders the world template' do
      expect(response).to render_template('world')
    end
  end

  # Repeat for each action in the controller...
end
