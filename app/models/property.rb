class Property < ActiveRecord::Base
  belongs_to :entity
  belongs_to :property_type
  validates :entity, presence: true
  validates :property_type, presence: true
  validates :value, uniqueness: true
end
