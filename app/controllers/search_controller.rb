# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @query = Store.includes(:user, :assembly, :sub_district, :community, :sector).ransack(params[:q])
    @stores = @query.result(distinct: true).paginate(page: params[:page], per_page: 8)
  end
end
