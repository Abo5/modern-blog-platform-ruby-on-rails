json.extract! blog_article, :id, :created_at, :short_title, :content, :word_count, :publisher, :url, :long_url_title, :short_url_title, :caption, :logo, :created_at, :updated_at
json.url blog_article_url(blog_article, format: :json)
