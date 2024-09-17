# frozen_string_literal: true

class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :name
      t.integer :row_order
      t.references :pipeline, null: false, foreign_key: true
      t.timestamps
    end
    add_index :stages, %i[pipeline_id row_order], unique: true
  end
end
