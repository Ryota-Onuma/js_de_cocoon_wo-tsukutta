class ProjectsController < ApplicationController
  require "json"
  def index
    @projects = Project.all
  end

  def new

  end
  def create 
    @project = Project.new(JSON.parse(data_params[:project]) )
    @project.save!
    JSON.parse(data_params[:tasks]).each do |task|
      @new_task = Task.new(name: task['name'],description: task['description'],project_id: @project.id)
      @new_task.save!
      JSON.parse(data_params[:todos]).each do |todo|
          if task['task_id'] == todo['task_id']
            item = Item.new(todo)
            item.task_id = @new_task.id
            item.save!
          end
        end
    end
    render status: 200,json: {'message': 'success'}
    rescue => e
      render status: 500, json: {"message": "エラーです"}
  end 

  def show
    @project = Project.find(paramp[:id])
  end

  def edit
    @project = Project.find(paramp[:id])
  end

  private
    def data_params
      params.require(:data).permit(:project,:tasks,:todos)
    end
end
