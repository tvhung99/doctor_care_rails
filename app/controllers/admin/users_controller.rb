class Admin::UsersController < Admin::AdminController
    def index
        @users = unless can? :read, User
                     []
                 else
                     User.all
                 end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        params[:id] = nil
        flash[:notice] = "User has been deleted"
        redirect_to :action => :index
    end

    def new 
        @user = User.new
    end

    def create
        user_attributes = user_params.to_h
        if params[:user][:role_id].to_i == 4
            doctor_attributes = doctor_params.to_h.merge(degree_ids: params[:user][:degree_ids].select{ |x| x.present? }.join("-"))
            user_params = user_attributes.merge doctor_attributes: doctor_attributes
            ActiveRecord::Base.transaction do
                user = User.create!(user_params)
                user.confirm!
                flash[:notice] = "Doctor has been created"
                redirect_to admin_users_path
            end
        else
            ActiveRecord::Base.transaction do
                user = User.create!(user_attributes)
                user.confirm!
                flash[:notice] = "User has been create"
                redirect_to admin_users_path
            end
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        user_attributes = user_edit_params.to_h
        if @user.doctor?
            doctor_attributes = doctor_params.to_h.merge(degree_ids: params[:user][:degree_ids].select{ |x| x.present? }.join("-"))
            user_params = user_attributes.merge doctor_attributes: doctor_attributes
            ActiveRecord::Base.transaction do
                @user.update_columns(user_params)
                flash[:notice] = "Doctor has been updated"
                redirect_to admin_users_path
            end
        else
            ActiveRecord::Base.transaction do
                @user.update_columns user_attributes
                Doctor.create! doctor_params.to_h.merge(degree_ids: params[:user][:degree_ids].select{ |x| x.present? }.join("-"), user_id: @user.id ) if params[:user][:role_id].to_i == 4
                flash[:notice] = "User has been updated"
                redirect_to admin_users_path
            end
        end
    end

    def show
        @user = User.find(params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :password, :password_confirmation, :address, :phone_number, :gender, :role_id  )
    end

    def user_edit_params
        params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :address, :phone_number, :gender, :role_id  )
    end

    def doctor_params
        params.require(:user).permit(:specialty_id, :clinic_id, :description, :degree_ids)
    end

    def degree_doctor_mapping_params
        params.require(:user).permit(:degree_ids)
    end
end