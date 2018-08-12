class TasksController < ApplicationController

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

  private

  def tasks_params
		params.require(:task).permit(:content, :state)
	end

end