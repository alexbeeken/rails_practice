class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]
  before_action :find_task_list, only: [:edit, :update, :destroy]

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = @task.list
  end

  def destroy
    find_task_list
    @task.destroy
    redirect_to list_path(@list)
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task successfully updated!"
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def finish_task
    @task = Task.find(params[:task_id])
    find_task_list
    @task.mark_done
    redirect_to list_path(@list)
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end

    def find_task
      @task = Task.find(params[:id])
    end

    def find_task_list
      @list = @task.list
    end
end
