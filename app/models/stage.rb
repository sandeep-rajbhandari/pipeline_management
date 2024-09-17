# frozen_string_literal: true

# == Schema Information
#
# Table name: stages
#
#  id          :bigint           not null, primary key
#  name        :string
#  row_order   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  pipeline_id :bigint           not null
#
# Indexes
#
#  index_stages_on_pipeline_id                (pipeline_id)
#  index_stages_on_pipeline_id_and_row_order  (pipeline_id,row_order) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (pipeline_id => pipelines.id)
#
class Stage < ApplicationRecord
  belongs_to :pipeline
  has_many :tasks, dependent: :nullify

  include RankedModel
  ranks :row_order
end
