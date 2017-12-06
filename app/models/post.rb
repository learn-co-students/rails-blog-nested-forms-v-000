class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  validates_presence_of :name, :content
  validates_presence_of :tags, allow_blank: false



  def tags_attributes=(tag_hash)
    if tag_hash[:name].present?
      tag = Tag.find_or_create_by(name: tag_hash[:name])
      if !self.tags.include?(tag) 
        self.post_tags.build(:tag => tag)
      end
    end
  end





end
