class EntityType < ActiveRecord::Base
  has_many :property_types, dependent: :destroy
  has_many :entities, dependent: :destroy
  validates :name, uniqueness: true
end
