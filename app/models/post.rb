class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}

  validates_presence_of :name, :content

  #def tag_attributes(tag_hash)
  #  binding.pry
  #  if tag_hash[:name].present?
  #    tag=Tag.find_or_create_by(tag_hash[:name])
  #  end
  #  if !self.tags.include?(tag)
  #    self.post_tags.build(:category =>category)
  #  end
  #end
end
