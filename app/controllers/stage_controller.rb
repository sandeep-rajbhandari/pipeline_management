# frozen_string_literal: true

class StageController < ApplicationController
  def edit
    @stage = Stage.find(params[:id])
  end

  def create
    @stage = Stage.new(stage_params)
    if @stage.save
      redirect_to pipeline_path(@stage.pipeline)
    else
      render :new, status: :unprocessable_entity
    end
    redirect_to pipeline_path(@stage.pipeline)
  end

  private

  def stage_params
    params.require(:stage).permit(:name, :pipeline_id)
  end
end
