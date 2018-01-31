class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  def tags_attributes=(tag_attributes)
    tag_attributes.each do |name, tag_attribute|
      unless tag_attribute == ""
        tag = Tag.find_or_create_by(tag_attribute)
        self.tags << tag
      end
    end
  end

  def update_tag_ids
    new = self.tag_ids.uniq
    self.tag_ids = new
    self.save
  end


end
