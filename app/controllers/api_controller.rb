class ApiController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  #before_action :restrict_acess

  private
  def restrict_acess
  	authenticate_or_request_with_http_token do |token, options|
      ApiKey.all(access_token: token).first
    end
  end
end