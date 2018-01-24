class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  accepts_nested_attributes_for :tags, reject_if: :all_blank

  validates_presence_of :name, :content

  # def tags_attributes=(attributes_hash)
  #   attributes_hash.values.each do |attributes|
  #     tags.build(attributes)
  #   end
  # end
end
