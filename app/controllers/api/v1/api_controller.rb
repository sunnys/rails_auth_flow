class Api::V1::ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!
	respond_to :json
end