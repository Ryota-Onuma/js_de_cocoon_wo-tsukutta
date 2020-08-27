class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @task =   @project.task.build
    @item = @task.item.build
  end
  def create 
    @project = Project.new(project_params)
    @project.save
  end

  def show
    @project = Project.find(paramp[:id])
  end

  def edit
    @project = Project.find(paramp[:id])
  end

  private
    def project_params
          params.require(:project).permit(:p_name, task_attributes: [:id, :c_name, :_destroy, item_attributes: [:id, :g_name, :_destroy]])
    end
end
