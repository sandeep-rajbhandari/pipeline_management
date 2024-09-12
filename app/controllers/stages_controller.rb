# frozen_string_literal: true

class StagesController < ApplicationController
  def create
    @stage = Stage.new(stage_params)
    if @stage.save
      render turbo_stream: [
        turbo_stream.after('prepend_stages', partial: 'pipeline_list/stage', locals: { stage: @stage, selected_pipeline_id: @stage.pipeline_id }),
        turbo_stream.remove('add_stage')
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def stage_params
    params.require(:stage).permit(:name, :pipeline_id)
  end
end
