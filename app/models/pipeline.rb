# frozen_string_literal: true

# == Schema Information
#
# Table name: pipelines
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pipeline < ApplicationRecord
  has_many :stages, dependent: :nullify

end
