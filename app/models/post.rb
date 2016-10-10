class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: proc {|att| att['name'].blank?}


  # def tags_attributes=(tags_attributes)
  #    tags_attributes.values.each do |tags_attribute|
  #      tag = Tag.find_or_create_by(tags_attribute)
  #      self.tags << tag
  #    end
  #  end

end
