class AddColumnsToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :published, :boolean
    add_column :articles, :favorite, :boolean
    add_reference :articles, :section, foreign_key: true
  end
end
