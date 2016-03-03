class CreatePropertyTypes < ActiveRecord::Migration
  def change
    create_table :property_types do |t|
      t.string :name, null: false
      t.belongs_to :entity_type, index: true, null: false
      t.timestamps null: false
    end
  end
end
