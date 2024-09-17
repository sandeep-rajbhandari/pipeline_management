# frozen_string_literal: true

class TasksController < ApplicationController
  def new
    @task = Task.new
    render 'tasks/new'
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render turbo_stream: [
        turbo_stream.before("append_tasks_#{@task.stage_id}", partial: 'pipeline_list/task', locals: { task: @task, selected_pipeline_id: @task.stage.pipeline_id }),
        turbo_stream.remove('add_task')
      ]
    else
      render 'tasks/new'
    end
  end

  def edit
    @task = Task.find(params[:id])
    render 'tasks/edit'
  end

  def update
    @task = Task.find(params[:id])
    return unless @task.update(task_params)

    redirect_to pipeline_list_index_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :stage_id, :taskable_id, :taskable_type)
  end
end
