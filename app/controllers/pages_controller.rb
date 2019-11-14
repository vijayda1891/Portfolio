class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def tech_news
  	@tweets = SocialTool.twitter_serach
  end
end
