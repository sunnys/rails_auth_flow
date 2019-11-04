class Api::V1::MembersController < Api::V1::ApiController
  before_action :set_member, only: [:show, :update, :destroy]

  def create
    @member = Member.new(member_params)
    if @member.save
      render json: @member, status: :created
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @member.destroy
    render json: {:status => "Removed Successfully"}
  end

  def index
    @members = Member.includes(:orders).all.as_json(:include => {:orders => { :include => {:item => {:only => :name}}, :only => [:quantity, :status]}})
    render json: @members
  end

  def show
    render json: @member.as_json(:include => {:orders => { :include => {:item => {:only => :name}}, :only => [:quantity, :status]}})
  end

  private
  def set_member
    @member = Member.includes(:orders).find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :email, :phone)
  end
end
