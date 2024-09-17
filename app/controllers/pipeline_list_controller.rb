# frozen_string_literal: true

class PipelineListController < ApplicationController
  def index
    @pipelines = Pipeline.all
    selected_pipeline_id = params[:selected_pipeline_id] || @pipelines.first.id
    @selected_pipeline = Pipeline.find(selected_pipeline_id)
  end

  def update_row_order
    @task = Task.find(permitted_update_row_params[:task_id])
    @task.update(row_order_position: permitted_update_row_params[:row_order_position], stage_id: permitted_update_row_params[:stage_id])
    head :no_content
  end

  def update_stage_row_order
    @stage = Stage.find(permitted_update_row_params[:stage_id])
    @stage.update(row_order_position: permitted_update_row_params[:row_order_position])
    head :no_content
  end

  def new_stage
    @stage = Stage.new(pipeline_id: params[:id])
    render 'stages/new'
  end

  def new_task
    @pipeline = Pipeline.find(params[:id])
    @tasks = @pipeline.model.constantize.where.not(id: Task.joins(stage: :pipeline).where(stages: { pipeline_id: @pipeline.id }).pluck(:id)).pluck(:name, :id)

    @task = Task.new
    render 'tasks/new'
  end

  private

  def permitted_update_row_params
    params.permit(
      :row_order_position,
      :stage_id,
      :id,
      :task_id
    )
  end
end
