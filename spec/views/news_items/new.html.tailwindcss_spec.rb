require 'rails_helper'

RSpec.describe "news_items/new", type: :view do
  before(:each) do
    assign(:news_item, NewsItem.new())
  end

  it "renders new news_item form" do
    render

    assert_select "form[action=?][method=?]", news_items_path, "post" do
    end
  end
end
