# frozen_string_literal: true

class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy tax  payment payment_list taxes_list]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /stores or /stores.json
  def index
    @stores = Store.paginate(page: params[:page], per_page: 2)
  end

  # GET /stores/1 or /stores/1.json
  def show
    @add_tax_path = "/stores/#{params[:id]}/tax"
    @pay_tax_path = "/stores/#{params[:id]}/payment"
    @store_payments_path = "/stores/#{params[:id]}/payments-list"
    @store_taxes_path = "/stores/#{params[:id]}/taxes-list"
  end

  def payment
    @payment = Payment.new
  end

  def payment_list
    @payments = Payment.where(store_id: params[:id])
    @total_payment = Payment.where(store_id: params[:id]).sum(:amount)
    @total_tax = Tax.where(store_id: params[:id]).sum(:amount)

    # @total_tax = StoreTax.where(store_id: params[:id]).map { |store| store.tax.amount }.sum
    if @total_tax > @total_payment
      @arrears = @total_tax - @total_payment
      @balance = 0
      @payment_complete = false
    else
      @arrears = 0
      @balance = @total_payment - @total_tax
      @payment_complete = true
    end
  end

  def tax
    @tax = Tax.new
  end

  def taxes_list
    @store_taxes = Tax.where(store_id: params[:id])
    @total_tax = Tax.where(store_id: params[:id]).sum(:amount)
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores or /stores.json
  def create
    @store = Store.new(store_params.merge(user: current_user))

    respond_to do |format|
      if @store.save
        format.html { redirect_to store_url(@store), notice: "Store was successfully created." }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1 or /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to store_url(@store), notice: "Store was successfully updated." }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1 or /stores/1.json
  def destroy
    @store.destroy

    respond_to do |format|
      format.html { redirect_to stores_url, notice: "Store was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(
        :assembly_id,
        :sub_district_id,
        :community_id,
        :sector_id,
        :serial_number,
        :digital_address,
        :purpose_of_structure,
        :mode_of_structure,
        :materials_used_for_walls,
        :address,
        :is_there_network_mast,
        :comments
      )
    end
end
