class Size < ActiveRecord::Base
  belongs_to :product
  validates :size, presence: true
  validates_uniqueness_of :size, :scope => :product_id
end
