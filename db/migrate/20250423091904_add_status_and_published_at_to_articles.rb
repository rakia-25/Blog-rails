class AddStatusAndPublishedAtToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :status, :integer 
    add_column :articles, :published_at, :datetime
  end
end
