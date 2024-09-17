# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  row_order     :integer
#  taskable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stage_id      :bigint           not null
#  taskable_id   :bigint           not null
#
# Indexes
#
#  index_tasks_on_stage_id                                    (stage_id)
#  index_tasks_on_stage_id_and_row_order                      (stage_id,row_order) UNIQUE
#  index_tasks_on_stage_id_and_taskable_id_and_taskable_type  (stage_id,taskable_id,taskable_type) UNIQUE
#  index_tasks_on_taskable                                    (taskable_type,taskable_id)
#
# Foreign Keys
#
#  fk_rails_...  (stage_id => stages.id)
#
class Task < ApplicationRecord
  belongs_to :taskable, polymorphic: true
  belongs_to :stage

  include RankedModel
  ranks :row_order, with_same: :stage_id
end
