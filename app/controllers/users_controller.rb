class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to users_path
    end
  end
  
  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "Update successfully"
     redirect_to user_path(@user.id) 
    else
     flash.now[:notice] = "Update error"
     render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :Introduction)
  end
end
