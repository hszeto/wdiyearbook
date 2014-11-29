class UsersController < ApplicationController

	def index

    end

# ----------------------- New User ------------------
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
        	session[:user_id] = @user.id  #I DON'T UNDERSTAND WHY WE NEED THIS LINE
            redirect_to :controller => 'users', :action => 'edit', :user_id => @user.id
        else
            render "new"
        end
    end

# ----------------------- Edit USER -----------------
	def edit
		@user = User.find(params[:user_id])
		@current_user ||= @user 
	end
	def update
		@user = User.find_by(params[:user_id])
		if @user.update_attributes(params.require(:user).permit(:name, :email, :location, :post, :avatar))
	  		#redirect_to user_path 
	  		redirect_to :controller => 'users', :action => 'edit', :user_id => @user.id
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

