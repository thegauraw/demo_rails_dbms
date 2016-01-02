class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate, :only => [:login]

  def logout
    host = env['HTTP_HOST']
    protocol = root_url.split(host)
    logout_url = "#{request.protocol}guest:password@#{env['HTTP_HOST']}"
    redirect_to logout_url
  end

  def login
    redirect_to :back and return
  end

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == USER_ID && password == PASSWORD
      end
    end
end
