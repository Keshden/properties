class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

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
      flash [:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end
