class PropertyType < ActiveRecord::Base
  belongs_to :entity_type
  has_many :properties, dependent: :destroy
  validates :entity_type, presence: true
  validates :name, uniqueness: true
end
