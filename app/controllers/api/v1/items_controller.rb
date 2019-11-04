class Api::V1::ItemsController < Api::V1::ApiController
  before_action :set_item, only: [:show]
  
  def new
    @item = Item.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @items = Item.all
    render json: @items
  end

  def show
    render json: @item
  end

  private
  def set_item
    @item = Item.friendly.find(params[:id])
  end
end
