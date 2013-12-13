class OrganisationsController < ApplicationController

  respond_to :html, :json
  respond_to :js, only: :index

  def index
    @organisations = Kaminari.paginate_array(Organisation.all.sort{|a,b| a.pull_request_count <=> b.pull_request_count}.reverse).page(params[:page])
    respond_with @organisations
  end

  def show
    @organisation = Organisation.find_by_login!(params[:id])
    respond_with @organisation
  end
end