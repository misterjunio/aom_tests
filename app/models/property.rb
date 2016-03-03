class Property < ActiveRecord::Base
  belongs_to :entity
  belongs_to :property_type
end
