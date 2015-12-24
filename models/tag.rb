require 'dynamoid'

class Tag
  include Dynamoid::Document

  field :word, :string

  has_and_belongs_to_many :articles

  def self.destroy(id)
    find(id).destroy
  end

  def self.delete_all
    all.each(&:delete)
  end
end
