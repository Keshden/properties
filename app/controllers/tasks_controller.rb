class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :show, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task successfully created"
      redirect_to property_path(@property)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def show

  end

  def index
    @task = Task.all
  end

  def destroy
    @task.destroy
    flash[:danger] = "Task successfully deleted"
    redirect_to property_path(@property)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end


end
