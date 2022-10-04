# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :is_admin

  def index
    @users = User.all.where.not(id: current_user.id).paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_role_params)
        format.html { redirect_to users_index_path, notice: "user was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # todo admins should create users
  def custom_create_user
    if current_user.admin?
      User.create(:email => params[:email], password => params[:password])
      redirect_to(some_path, notice: "sucessfully updated user.")
    else
      redirect_to(some_other_path, notice: "You are not authorized to do this.")
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_role_params
      params.require(:user).permit(:role, :name)
    end
end
