class Api::V1::BookedOrdersController < Api::V1::ApiController
  before_action :set_booked_order, only: [:show, :update, :destroy]

  def create
    @booked_order = BookedOrder.new(bookedorder_params)
    if @booked_order.save
      render json: @booked_order, status: :created
    else
      render json: @booked_order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @booked_order.update(booked_order_params)
      render json: @booked_order
    else
      render json: @booked_order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booked_order.destroy
    render json: {:status => "Removed Successfully"}
  end

  def index
    @booked_orders = BookedOrder.all
    render json: @booked_orders
  end

  def show
    render json: @booked_order
  end

  private
  def set_booked_order
    @booked_order = BookedOrder.find(params[:id])
  end

  def booked_order_params
    params.require(:booked_order).permit(:item_id, :member_id, :quantity)
  end
end
