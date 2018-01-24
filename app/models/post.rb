class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :post_tags
    has_many :tags, :through => :post_tags

    validates_presence_of :name, :content

    accepts_nested_attributes_for :tags, reject_if: :all_blank

    def tags_attributes= (tags_attributes)
        if tags_attributes.is_a? Hash
            @tag = Tag.find_or_create_by(tags_attributes["0"]) 
            if @tag.save
                self.tags << @tag
            end
        end
    end
end
