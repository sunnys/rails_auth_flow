class Api::V1::HomeController < Api::V1::ApiController
    def index
        render json: {message: "You are in home page"}
    end
end
