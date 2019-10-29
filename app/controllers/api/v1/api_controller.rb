class Api::V1::ApiController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_user!
	respond_to :json
end