class Entity < ActiveRecord::Base
  belongs_to :entity_type
  has_many :properties, dependent: :destroy
  validates :entity_type, presence: true
  validates :value, uniqueness: true
end
