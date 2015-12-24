class Article
  include Dynamoid::Document
  field :title, :string
  has_and_belongs_to_many :tags

  def self.destroy(id)
    find(id).destroy
  end

  def self.delete_all
    all.each(&:delete)
  end
end
