class EntityType < ActiveRecord::Base
  has_many :property_types
  has_many :entities
end
