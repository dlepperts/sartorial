class ApplicationController < ActionController::Base
    
    # before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    
    def current_user
        @user = User.find_by(username: session[:username])
    end

    def logged_in?
        !current_user.nil?
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end

    def is_tailor?
        self.usable_type == tailor
    end

    def all_tailors
        @tailors = User.all.select do |user|
            user.usable_type == "Tailor"
        end
    end

end
