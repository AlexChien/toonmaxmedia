class AddWeightToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :weight, :integer, :default => 0
  end
end