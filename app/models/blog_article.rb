class BlogArticle < ApplicationRecord
  before_save :calculate_word_count

  private

  def calculate_word_count
    self.word_count = content.split.size
  end
end
