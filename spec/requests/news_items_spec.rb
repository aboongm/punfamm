require 'rails_helper'

RSpec.describe NewsItemsController, type: :request do
  let(:user) { create(:user) }
  let(:news_item) { create(:news_item, author: user) }

  before { sign_in user }

  describe "GET root path" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      # get "/news_items/#{news_item.id}" # This works too
      get news_item_path(news_item)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get new_news_item_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_news_item_path(news_item)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:category) { create(:category) }
      let(:valid_attributes) do
        attributes_for(:news_item).merge(category_id: category.id)
      end

      it "creates a new news item" do
        expect {
          post news_items_path, params: { news_item: valid_attributes }
        }.to change(NewsItem, :count).by(1)
      end

      it "redirects to the created news item" do
        post news_items_path, params: { news_item: valid_attributes }
        expect(response).to redirect_to(news_item_path(NewsItem.last))
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { attributes_for(:news_item, title: nil) }

      it "returns http success" do
        post news_items_path, params: { news_item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:category) { create(:category) }
      let(:new_attributes) do
        attributes_for(:news_item).merge(category_id: category.id)
      end

      it "updates the requested news item" do
        patch news_item_path(news_item), params: { news_item: new_attributes }
        news_item.reload
        expect(news_item.title).to eq(new_attributes[:title])
      end

      it "redirects to the news item" do
        patch news_item_path(news_item), params: { news_item: new_attributes }
        expect(response).to redirect_to(news_item_path(news_item))
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { attributes_for(:news_item, title: nil) }

      it "returns http success" do
        patch news_item_path(news_item), params: { news_item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:news_item) { create(:news_item) }
    
    it "destroys the requested news item" do
        expect {
        delete news_item_path(news_item)
        }.to change(NewsItem, :count).by(-1)
    end

    it "redirects to the news items list" do
        delete news_item_path(news_item)
        expect(response).to redirect_to(news_items_url)
    end
  end
end
