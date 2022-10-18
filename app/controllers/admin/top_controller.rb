class Admin::TopController < Admin::AdminController
    def index
        redirect_to login_path unless logged_in?
    end
end