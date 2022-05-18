class Admin::CompaniesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @company = Company.new
  end

  def create
   @company = Company.new(company_params)
   if @company.save
     redirect_to admin_companies_path
   else
     render "new"
   end
  end

  def index
    @companies = Company.page(params[:page])
  end

  private

  def company_params
    params.require(:company).permit(:name, :telephone_number, :email, :fax_number, :deadline)
  end
end
