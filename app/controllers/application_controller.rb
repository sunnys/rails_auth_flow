class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, if: :verify_api
    before_action :authenticate_user!, if: :verify_api
    skip_before_action :verify_authenticity_token, if: :verify_api

    private
    def verify_api
        !['devise_token_auth', 'api'].include?(params[:controller].split('/')[0])
    end
end
