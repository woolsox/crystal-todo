class TaskController < ApplicationController
  getter task = Task.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_task }
  end

  def index
    tasks = Task.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    task = Task.new task_params.validate!
    if task.save
      redirect_to action: :index, flash: {"success" => "Created task successfully."}
    else
      flash[:danger] = "Could not create Task!"
      render "new.slang"
    end
  end

  def update
    task.set_attributes task_params.validate!
    if task.save
      redirect_to action: :index, flash: {"success" => "Updated task successfully."}
    else
      flash[:danger] = "Could not update Task!"
      render "edit.slang"
    end
  end

  def destroy
    task.destroy
    redirect_to action: :index, flash: {"success" => "Deleted task successfully."}
  end

  def toggle_completion
    task.set_attribute(:status, "Complete")
    redirect_to action: :index, flash: {"success" => "Update Task status successfully."}
  end

  private def task_params
    params.validation do
      required :task
      required :description
    end
  end

  private def set_task
    @task = Task.find! params[:id]
  end
end
