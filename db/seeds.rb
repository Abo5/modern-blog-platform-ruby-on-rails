# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# require 'faker'

# 30.times do |i|
#   BlogArticle.create!(
#     short_title: Faker::Lorem.sentence(word_count: 3),  # عنوان قصير
#     content: Faker::Lorem.paragraph(sentence_count: 10),  # محتوى المقالة
#     word_count: Faker::Lorem.paragraph(sentence_count: 10).split.size,  # تعداد الكلمات
#     publisher: Faker::Name.name,  # اسم الناشر
#     url: "http://localhost:3000/blog_articles/#{i + 1}",  # رابط المقالة
#     long_url_title: Faker::Lorem.sentence(word_count: 5),  # عنوان طويل للرابط
#     short_url_title: Faker::Lorem.sentence(word_count: 2),  # عنوان قصير للرابط
#     caption: Faker::Lorem.sentence(word_count: 6),  # نص توضيحي تحت الرابط
#     logo: Faker::Company.name  # نص لتمثيل الشعار
#   )
# end

# puts "30 blog articles created!"
