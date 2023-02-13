require 'rails_helper'

RSpec.describe "news_items/edit", type: :view do
  let(:news_item) {
    NewsItem.create!()
  }

  before(:each) do
    assign(:news_item, news_item)
  end

  it "renders the edit news_item form" do
    render

    assert_select "form[action=?][method=?]", news_item_path(news_item), "post" do
    end
  end
end
