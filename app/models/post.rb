class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: proc {|attributes| attributes['kind'].blank?}

  def tags_attributes=(tags_attributes)
    self.save
    tags_attributes.each do |i, tag_attribute|
      if tag_attribute.present?
        tag = self.tags.find_or_create_by(name: tag_attribute[:name])
        if !self.tags.include?(tag)

          self.post_tag.build(:tag => tag)
        end
      end
    end
  end
end
