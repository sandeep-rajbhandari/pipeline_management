# frozen_string_literal: true

class CreatePipelines < ActiveRecord::Migration[7.0]
  def change
    create_table :pipelines do |t|
      t.string :name
      t.timestamps
    end
  end
end
