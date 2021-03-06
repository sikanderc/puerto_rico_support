class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def current_user
      User.where(id: session[:user_id]).first
      # I think: this gets us the current user that is logged in. this can also be nil
    end


    helper_method :current_user
    # I think: now we can access the current_user in the view
end
