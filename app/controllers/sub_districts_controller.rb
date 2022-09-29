# frozen_string_literal: true

class SubDistrictsController < ApplicationController
  before_action :set_sub_district, only: %i[ show edit update destroy ]

  # GET /sub_districts or /sub_districts.json
  def index
    @sub_districts = SubDistrict.all
  end

  # GET /sub_districts/1 or /sub_districts/1.json
  def show
  end

  # GET /sub_districts/new
  def new
    @sub_district = SubDistrict.new
  end

  # GET /sub_districts/1/edit
  def edit
  end

  # POST /sub_districts or /sub_districts.json
  def create
    @sub_district = SubDistrict.new(sub_district_params)

    respond_to do |format|
      if @sub_district.save
        format.html { redirect_to sub_district_url(@sub_district), notice: "Sub district was successfully created." }
        format.json { render :show, status: :created, location: @sub_district }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_districts/1 or /sub_districts/1.json
  def update
    respond_to do |format|
      if @sub_district.update(sub_district_params)
        format.html { redirect_to sub_district_url(@sub_district), notice: "Sub district was successfully updated." }
        format.json { render :show, status: :ok, location: @sub_district }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_districts/1 or /sub_districts/1.json
  def destroy
    @sub_district.destroy

    respond_to do |format|
      format.html { redirect_to sub_districts_url, notice: "Sub district was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_sub_district
      @sub_district = SubDistrict.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_district_params
      params.require(:sub_district).permit(:name)
    end
end
