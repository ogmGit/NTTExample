class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:email], params[:password])  # authenticate user 
	  session[:user_id] = user.id									# store user id in session
	  #redirect_to '/welcomes', :notice => "Logged in successfully"	# redirect is successful
	  redirect_to welcomes_index_path, :notice => "Logged in successfully"	# redirect is successful	  
	else
	  flash.now[:alert] = "Invalid login/password combination"		# alert if error
	  render :action => 'index'										# redirect to the same page
	end
  end

  def index
    if user = User.authenticate(params[:email], params[:password])  # authenticate user 
	  session[:user_id] = user.id									# store user id in session
	  redirect_to welcomes_index_path, :notice => "Logged in successfully"	# redirect is successful	  
	else
	  render :action => 'index'										# redirect to the same page
	end
  end 
  
  def new
	@user = User.new
	redirect_to users_new_path
  end 

  #destroy session on login out
  def destroy
    reset_session													# reset all of the values for the current session
    redirect_to login_path, :notice => "You successfully logged out"	# redirect 
  end


end
