# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :row_order
      t.references :taskable, polymorphic: true, null: false
      t.references :stage, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tasks, %i[stages row_order], unique: true
    add_index :tasks, %i[stages taskable_id taskable_type], unique: true

  end
end
