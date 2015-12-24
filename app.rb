require_relative 'config/init'
require_relative 'models/init'

# Create tables if they do not exist
Article.create_table
Tag.create_table

# Delete database records
Article.delete_all
Tag.delete_all

# Define save_tag method
def create_article(title_s, tags_a)
  article = Article.new(title: title_s).save

  tags_a.each do |t|
    word_tag = Tag.where(word: t).first
    unless word_tag
      word_tag = Tag.new(word: t).save
    end

    article.tags << word_tag
  end
end

# Create two new articles with some common tags
create_article( 'NTHU partners with iChef',
                ['mobile', 'ichef', 'nthu', 'taiwan'])

create_article( 'Apple has secret facility in Taiwan',
                ['mobile', 'taiwan', 'apple'])

# Find articles by a word_tag
found = Tag.find_by_word('s')
found.articles.each { |article| puts article.title } if found
