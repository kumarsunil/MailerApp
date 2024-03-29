class LoginController < ApplicationController
  before_filter :reset_session, :only => [:index, :logout]


  def index
  end

  def perform_login

    @user = User.find(:first, :conditions => ["user_name = ?", params[:user][:user_name]])
	 #@user = User.find(:first, :conditions => ["user_name = ? AND password = ?", params[:user][:user_name], hash_pswd])

     if @user.nil?
        flash[:alert] = "Invalid user"
        render :template => "/login/index"
      else
        if @user.password_correct?(params[:user][:password])
          session[:user] = @user
          session[:user_id] = @user.id
          render :template => "users/#{@user.user_type}"
        else  
          flash[:alert] = "Username/password do not match"
          redirect_to root_path, :alert => "Username/password do not match"
        end
      end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_url
  end

end
