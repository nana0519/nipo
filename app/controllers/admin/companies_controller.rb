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

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to admin_company_path(@company)
    else
      render "edit"
    end
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :telephone_number, :email, :fax_number, :deadline)
  end
end
