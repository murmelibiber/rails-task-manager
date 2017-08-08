class TasksController < ApplicationController

  def index
    #@tasks = Task.all
    @tasks = Task.order(created_at: :desc).all
    #PLURAL!!
    #this is like sql to have it ordered the other way around that the newest one is on the top and
    #not on the button!
  end

  def show
    @task = Task.find(params[:id])
  #SINGULAR!!
  end

    def new
      @task = Task.new
    end

    def edit
      @task = Task.find(params[:id])
    end


    def create
      @task = Task.new(task_params)
      @task.save
      redirect_to task_path(@task)
    end

    def update
      @task = Task.find(params[:id])
      @task.update(task_params)
      redirect_to task_path(@task)
    end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path

  end

  private

  def task_params
    params.require(:task).permit(:name, :detail)
  end

end
