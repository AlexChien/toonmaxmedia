class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.integer :category_id, :default => 1
      t.date :news_date, :null => false
      t.string :title, :null => false
      t.string :source, :default => "炫动传播"
      t.text :content

      t.timestamps
    end

    add_index :news_items, :category_id
  end
end