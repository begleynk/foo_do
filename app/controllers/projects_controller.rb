class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      redirect_to @project, notice: "Project created! Whoop!"
    else 
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.delete
      redirect_to projects_path, notice: "Project was indeed deleted..."
    else
      redirect_to projects_path, error: "Wat"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :note, :due_date)
  end
end
