class CommentsController < ApplicationController
  def new
  end

  def create
    @user = User.where(username: params[:username]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "You signed in successfully."
      redirect_to home_path
    else
      flash[:alert] = "Unable to sign in. Check username and password."
      redirect_to home_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end
