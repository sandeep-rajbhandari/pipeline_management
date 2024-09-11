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
