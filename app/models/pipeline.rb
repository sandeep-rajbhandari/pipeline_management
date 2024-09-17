# frozen_string_literal: true

# == Schema Information
#
# Table name: pipelines
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  model      :string
#  name       :string
#  partial    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pipeline < ApplicationRecord
  has_many :stages, dependent: :nullify

  validate :model_validation

  def model_validation
    model.constantize.new.valid?
  rescue StandardError => e
    errors.add(:model, "is not a valid model: #{e.message}")
  end
end
