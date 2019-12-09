class SearchController < ApplicationController
  def index
    @members = HouseSearch.new(params[:house]).members
  end
end
