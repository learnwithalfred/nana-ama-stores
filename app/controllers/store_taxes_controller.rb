# frozen_string_literal: true

class StoreTaxesController < ApplicationController
  before_action :set_store_tax, only: %i[ show edit update destroy ]
  before_action :authenticate_author!
  # load_and_authorize_resource

  # GET /store_taxes or /store_taxes.json
  def index
    @store_taxes = StoreTax.all
  end

  # GET /store_taxes/1 or /store_taxes/1.json
  def show
  end

  # GET /store_taxes/new
  def new
    @store_tax = StoreTax.new
  end

  # GET /store_taxes/1/edit
  def edit
  end

  # POST /store_taxes or /store_taxes.json
  def create
    @store_tax = StoreTax.new(store_tax_params)

    respond_to do |format|
      if @store_tax.save
        format.html { redirect_to store_tax_url(@store_tax), notice: "Store tax was successfully created." }
        format.json { render :show, status: :created, location: @store_tax }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_taxes/1 or /store_taxes/1.json
  def update
    respond_to do |format|
      if @store_tax.update(store_tax_params)
        format.html { redirect_to store_tax_url(@store_tax), notice: "Store tax was successfully updated." }
        format.json { render :show, status: :ok, location: @store_tax }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_taxes/1 or /store_taxes/1.json
  def destroy
    @store_tax.destroy

    respond_to do |format|
      format.html { redirect_to store_taxes_url, notice: "Store tax was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_store_tax
      @store_tax = StoreTax.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_tax_params
      params.require(:store_tax).permit(:store_id, :tax_id)
    end
end
