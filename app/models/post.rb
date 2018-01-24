class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  #accepts_nested_attributes_for :tags, reject_if: :all_blank


  def tags_attributes=(attributes)
    attributes.each do |key,value|
      if !value.blank?
      tag = Tag.create(attributes)
      self.tags << tag
    end
    end
  end


end
