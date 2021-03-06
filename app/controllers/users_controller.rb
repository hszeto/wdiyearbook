class UsersController < ApplicationController

skip_before_filter :authorize

    def index
    end

# ----------------------- Show User -----------------   
    def show
        @user = User.find(params[:id])
    end
# ----------------------- New User ------------------
    def new
        @user = User.new
    end

    def create
        @current_user = current_user
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id.to_s  #I DON'T UNDERSTAND WHY WE NEED THIS LINE
            redirect_to edit_user_path(@user)
        else
            render "new"
        end
    end

# ----------------------- Edit USER -----------------
    def edit
        @user = User.find(params[:id])
        @current_user ||= @user 
    end
    def update
        @user = User.find(params[:id])
        @current_user ||= @user 
        if @user.update_attributes(params.require(:user).permit(:name, :email, :location, :post, :avatar))
            redirect_to edit_user_path(@user)
            #redirect_to :controller => 'users', :action => 'edit', :user_id => @user.id
        else
            render 'edit'
        end
    end

# ----------------------- User Params ---------------
    private
    def user_params
        params.require(:user).permit(:name, :email, :location, :post, :password, :password_confirmation, :avatar)
    end
end
