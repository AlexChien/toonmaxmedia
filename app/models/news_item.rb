class NewsItem < ActiveRecord::Base
  validates_presence_of :title

  scope :recent, order("news_date desc, created_at desc")

  def prev
    NewsItem.recent.where("id < ?", self.id).first
  end

  def next
    NewsItem.recent.where("id > ?", self.id).last
  end
end
