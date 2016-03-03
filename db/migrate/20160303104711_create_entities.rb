class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :value, null: false
      t.belongs_to :entity_type, index: true, null: false
      t.timestamps null: false
    end
  end
end
