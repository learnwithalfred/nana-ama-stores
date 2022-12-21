# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_query

  def set_query
    @query = Store.includes(:author, :assembly, :sub_district, :community, :sector).ransack(params[:q])
  end

  def is_admin
    unless current_author.admin? || current_author.super_admin? || current_author.it?
      flash[:danger] = "You do not have permission to perform this task"
      redirect_to root_path
    end
  end

  # rescue_from CanCan::AccessDenied do |exception|
  #   exception.default_message = "You are not authorized to purform this task"
  #   respond_to do |format|
  #     format.json { head :forbidden }
  #     format.html { redirect_to root_path, alert: exception.message }
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :address])
  end
end
