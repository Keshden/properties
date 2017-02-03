class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  #before_action :require_same_user, only: [:edit, :update, :destroy]
  #before_action :require_admin, only: [:destroy]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfully created"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Account updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:danger] = "User account has been successfully deleted"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if !logged_in?
      flash[:danger] = "You need to be logged in to perform those actions"
      redirect_to root_path
    elsif current_user != @user && !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end
