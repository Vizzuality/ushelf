class HomeController < ApplicationController

  def show

    @last_event = Event.order('"from" DESC').limit(1).first
    @blog_posts = BlogPost.live.limit(2)
    
  end

end