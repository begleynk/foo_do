class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])

    @task = @project.tasks.new(task_params)

    if @task.save
      render json: @task.to_json
    else
      render json: @task.errors.to_json, status: 401
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task    = Task.find(params[:id])

    @task.update(task_params)

    render json: @task.to_json
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
