class Entity < ActiveRecord::Base
  belongs_to :entity_type
  has_many :properties
  validates :entity_type, presence: true
end
