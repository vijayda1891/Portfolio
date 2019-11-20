class TopicsController < ApplicationController
	layout 'blog'
	before_action :side_bar_topics

  def index
  	@topics = Topic.all
  end

  def show
  	@topic = Topic.find(params[:id])
  	if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent_blogs.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent_blogs.page(params[:page]).per(5)
    end
  end

  private

  def side_bar_topics
  	@side_bar_topics = Topic.no_blogs
  end
end
