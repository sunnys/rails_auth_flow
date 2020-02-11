class Api::V1::TasksController < Api::V1::ApiController
  before_action :set_task, only: [:show, :update, :destroy]

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render json: {:status => "Removed Successfully"}
  end

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    render json: @task
  end

  def by_date
    date = params[:date]
    @tasks = Task.where("DATE(created_at) = ?", Date.parse(date))
    p @tasks
    render json: @tasks
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
