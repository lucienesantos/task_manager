class CreateMakros < ActiveRecord::Migration[5.0]
  def change
    create_table :makros do |t|
      t.string :name
      t.text :description
      
      t.boolean :active, default: false
      t.boolean :deleted, default: false

      t.datetime :completed_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
