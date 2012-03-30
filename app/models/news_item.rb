class NewsItem < ActiveRecord::Base
  validates_presence_of :title

  scope :recent, order("weight desc, news_date desc")

  def prev
    NewsItem.recent.where("id < ?", self.id).first
  end

  def next
    NewsItem.recent.where("id > ?", self.id).last
  end
end
