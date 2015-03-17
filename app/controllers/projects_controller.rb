class ProjectsController < ApplicationController

  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    if @project.user == current_user
      render :show
    else
      redirect_to projects_path, notice: "That's like totally not your project."
    end
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    
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
