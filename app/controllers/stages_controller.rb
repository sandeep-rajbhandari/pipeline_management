# frozen_string_literal: true

class StagesController < ApplicationController
  def create
    @stage = Stage.new(stage_params)
    if @stage.save
      render turbo_stream: [
        turbo_stream.before('prepend_stages', partial: 'pipeline_list/stage', locals: { stage: @stage, selected_pipeline_id: @stage.pipeline_id }),
        turbo_stream.remove('add_stage')
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @stage = Stage.find(params[:id])
    if @stage.update(stage_params)
      render turbo_stream: [
        turbo_stream.replace("stage_#{@stage.id}", html: helpers.tag.span(@stage.name, id: "stage_#{@stage.id}")),
        turbo_stream.remove('edit_stage')
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @stage = Stage.find(params[:id])
  end

  private

  def stage_params
    params.require(:stage).permit(:name, :pipeline_id)
  end
end
