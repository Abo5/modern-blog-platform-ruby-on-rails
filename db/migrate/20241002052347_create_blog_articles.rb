class CreateBlogArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :blog_articles do |t|
      t.string :short_title
      t.text :content
      t.integer :word_count
      t.string :publisher
      t.string :url
      t.string :long_url_title
      t.string :short_url_title
      t.string :caption
      t.string :logo

      t.timestamps
    end
  end
end
