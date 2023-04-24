class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user =User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです"
    end  
  end

  def edit
    @user =User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです"
    end
  end

def acount
  @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user), alert: "不正なアクセスです"
  end  
end

def acount_edit
  @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user), alert: "不正なアクセスです"
  end
end

def update
  @user =User.find(params[:id])
  if @user.update(user_params)
    sign_in :user, @user, bypass: true
    redirect_to user_path(@user), notice: "プロフィール情報を更新しました。"
  else
    flash.now[:alert] = "プロフィール情報を更新できませんでした。"
    render action: :show
  end  
end

private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :image, :password )
  end

end
