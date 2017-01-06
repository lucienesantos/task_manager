class CreateKeeps < ActiveRecord::Migration[5.0]
  def change
    create_table :keeps do |t|
      t.string :title
      t.boolean :started, default: false
      t.datetime :started_at

      t.boolean :completed, default: false
      t.datetime :completed_at

      t.boolean :deleted, default: false
      t.datetime :deleted_at

      t.references :makro, foreign_key: true

      t.timestamps
    end
  end
end
