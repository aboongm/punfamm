class PagesController < ApplicationController
  before_action :get_author

  def home
    @date = Date.today
    @daily = Daily.find_by(posted_date: @date.to_s)
    @politics = NewsItem.all.where(category_id: 2).order("created_at desc")
    # binding.pry
  end

  def world
    @world = NewsItem.all.where(category_id: 1).order("created_at desc")   
  end

  def politics
    @politics = NewsItem.all.where(category_id: 2).order("created_at desc")   
  end

  def business
    @business = NewsItem.all.where(category_id: 3).order("created_at desc")   
  end

  def market
    @market = NewsItem.all.where(category_id: 4).order("created_at desc")   
  end

  def health
    @health = NewsItem.all.where(category_id: 5).order("created_at desc")   
  end

  def entertainment
    @entertainment = NewsItem.all.where(category_id: 6).order("created_at desc")   
  end

  def tech
    @tech = NewsItem.all.where(category_id: 7).order("created_at desc")   
  end

  def style
    @style = NewsItem.all.where(category_id: 8).order("created_at desc")   
  end

  def travel
    @travel = NewsItem.all.where(category_id: 9).order("created_at desc")   
  end

  def sports
    @sports = NewsItem.all.where(category_id: 10).order("created_at desc")   
  end

  def videos
    @videos = NewsItem.all.where(category_id: 11).order("created_at desc")   
  end

  def features
    @features = NewsItem.all.where(category_id: 12).order("created_at desc")   
  end

  def weather
    @weather = NewsItem.all.where(category_id: 13).order("created_at desc")   
  end
  
  def photos
    @photos = NewsItem.all.where(category_id: 14).order("created_at desc")   
  end

  def longform
    @longform = NewsItem.all.where(category_id: 15).order("created_at desc")   
  end

  def punfamm_profiles
    @punfamm_profiles = NewsItem.all.where(category_id: 16).order("created_at desc")   
  end

  def punfamm_leadership
    @punfamm_leadership = NewsItem.all.where(category_id: 17).order("created_at desc")   
  end

  def punfamm_newsletters
    @punfamm_newsletters = NewsItem.all.where(category_id: 18).order("created_at desc")   
  end

  def work_for_punfamm
    @work_for_punfamm = NewsItem.all.where(category_id: 19).order("created_at desc")   
  end

  private

  def get_author
    # @news_items = NewsItem.all
    # @news_item = NewsItem.find(params[:id])
    # @author = User.find_by(id: @news_item.author_id)
  end
  
end
