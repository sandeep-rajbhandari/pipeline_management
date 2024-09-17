# frozen_string_literal: true

class CreatePipelines < ActiveRecord::Migration[7.0]
  def change
    create_table :pipelines do |t|
      t.string :name
      t.string :model
      t.boolean :active, default: true
      t.string :partial
      t.timestamps
    end
  end
end
