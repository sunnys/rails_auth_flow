class Api::V1::OrdersController < Api::V1::ApiController
  before_action :set_order, only: [:show, :update, :destroy]

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    render json: {:status => "Removed Successfully"}
  end

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:item_id, :member_id, :quantity)
  end
end
