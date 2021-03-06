class UsersController < ApplicationController

  skip_before_action :require_login, only: [:show_login_form, :do_login, :show_register_form, :do_create_user]

  before_action :skip_login, only: [:show_login_form, :show_register_form]

  def show_login_form
    render 'users/login'
  end

  def do_login
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if !!@user
      store_id_and_redirect_to_home(@user)
    else
      flash[:error] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def show_register_form
    @user = User.new
    render 'users/register'
  end

  def do_create_user
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      store_id_and_redirect_to_home(@user)
    else
      render 'users/register'
    end
  end

  def do_logout
    reset_session
    redirect_to login_path
  end

  def show_friend_list
    @strangers = current_user.strangers
    @friends = current_user.friends
    render 'friend_list'
  end

  def befriend
    Friendship.befriend(current_user.id, params[:friend_id])
    redirect_to(friends_path)
  end

  def unfriend
    Friendship.unfriend(current_user.id, params[:friend_id])
    redirect_to(friends_path)
  end

  def block_friend
    Friendship.block_friend(current_user.id, params[:friend_id])
    redirect_to(friends_path)
  end

  def unblock_friend
    Friendship.unblock_friend(current_user.id, params[:friend_id])
    redirect_to(friends_path)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def store_id_and_redirect_to_home(user)
    session[:user_id] = user.id
    redirect_to inbox_path
  end
end
