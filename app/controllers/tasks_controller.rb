class TasksController < ApplicationController
	before_action :set_task, only:[:edit, :update, :show, :destroy, :change]
	
	def index
	end

  def new
    @task = Task.new
	end
	
	def edit
	end

	def create
		@task = current_user.tasks.new(tasks_params)
		if @task.save
			flash[:notice] = "Task was successfully created."
			redirect_to tasks_path(@task)
		else
			render 'new'
		end
	end

	def create 
		@task = current_user.tasks.new(tasks_params)
		if @task.save
			flash[:notice] = "Task was successfully created."
			redirect_to tasks_path(@task)
		else
			render 'new'
		end
	end

	def show 
	end

	def destroy
		@task.destroy
		flash[:notice] = "Task was successfully deleted."
		redirect_to tasks_path
	end

	private
	
	def set_task
		@task = Task.find(params[:id])
	end

  def tasks_params
		params.require(:task).permit(:content, :state)
	end

end