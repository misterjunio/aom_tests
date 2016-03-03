class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :type
      t.belongs_to :entity_type, index: true
      t.timestamps null: false
    end
  end
end
