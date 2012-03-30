class NewsController < ApplicationController
  def index
    @news_items = NewsItem.recent.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    begin
      @news = NewsItem.find(params[:id])
    rescue
      render_404
    end

    if @news
      @prev_news = @news.prev
      @next_news = @news.next
    end
  end

end
