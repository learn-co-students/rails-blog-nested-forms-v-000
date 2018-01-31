require 'pry'
class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags
  validates_presence_of :name, :content

  def tags_attributes=(tag_attributes_hash)
    tag_attributes_hash.each do |i, tag_attribute|
      #binding.pry
      if tag_attribute.present? && tag_attribute[:name].present?
        tag = Tag.find_or_create_by(name:tag_attribute[:name])
        if !self.tags.include?(tag)
          self.tags << tag
        end
      end
    end
  end

end
