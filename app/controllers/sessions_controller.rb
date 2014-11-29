class SessionsController < ApplicationController

	def new
	end
	
	def create
	    user = User.where(email: params[:email]).first
	    # first make sure we actually find a user
	    # then see if user authenticates
	    if user && user.authenticate(params[:password])
	        # sets the cookie to the browser
	        session[:user_id] = user.id.to_s #I DON'T UNDERSTAND WHY WE NEED THIS LINE
	        # redirect_to profile_path
	        redirect_to :controller => 'users', :action => 'edit', :user_id => user.id.to_s

	    else
	        flash.now.alert = "Email or password is invalid"
	        flash.now[:notice] = 'Log in failed.'
	        render "new"
	        # redirect_to new_session_path
	    end
	end

	def destroy
	    # Kill our cookies!
	    reset_session
	    redirect_to root_path
	end

end
