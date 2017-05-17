class RemoveFavoriteFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :favorite, :boolean
  end
end
