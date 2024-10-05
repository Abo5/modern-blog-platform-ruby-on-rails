class AddCategoryNameInitialToBlogArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :blog_articles, :category, :string
    add_column :blog_articles, :name, :string
    add_column :blog_articles, :initial, :string
  end
end
