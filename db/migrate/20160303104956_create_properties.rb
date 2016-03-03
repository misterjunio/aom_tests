class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :value, null: false
      t.belongs_to :entity, index: true, null: false
      t.belongs_to :property_type, index: true, null: false
      t.timestamps null: false
    end
  end
end
