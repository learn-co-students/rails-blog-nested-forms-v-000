class Sparrow < ActiveRecord::Base
  has_many :nests
  has_many :eggs
  validates_presence_of :name

  accepts_nested_attributes_for :nests, reject_if: :all_blank?

  def nest_attributes=(nest_attributes)
    nest_attributes.values.each do |nest_attribute|
      nest = Nest.find_or_create_by(tag_attribute)
      self.nests << nest
    end
  end
end
