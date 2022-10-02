# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @query = Store.includes(:user, :assembly, :sub_district, :community, :sector).ransack(params[:q])
    @stores = @query.result(distinct: true)
  end
end
