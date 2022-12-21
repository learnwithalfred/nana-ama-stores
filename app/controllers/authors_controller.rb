# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]
  before_action :authenticate_author!
  # before_action :is_admin

  def index
    @authors = Author.all.where.not(id: current_author.id).paginate(page: params[:page], per_page: 10).order(id: :asc)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @author.update(author_role_params)
        format.html { redirect_to authors_index_path, notice: "author was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  private

    def set_author
      @author = Author.find(params[:id])
    end

    def author_role_params
      params.require(:author).permit(:role, :name)
    end
end
