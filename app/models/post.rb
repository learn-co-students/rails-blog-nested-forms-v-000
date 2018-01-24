class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |i, tag_attributes| #parses out the hashes if tags_attributes is either an array or a hash
      self.tags.build(tag_attributes) if tag_attributes.present? && tag_attributes[:name].present? #checks for nil
    end
  end

end
