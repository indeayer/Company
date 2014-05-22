class CompanyFacebooksController < ApplicationController
  before_action :set_company_facebook, only: [:show, :edit, :update, :destroy]

  # GET /company_facebooks
  # GET /company_facebooks.json

  require 'net/http'

  def intro
  end
  
  def index
    @company_facebooks = CompanyFacebook.all
   end

  # GET /company_facebooks/1
  # GET /company_facebooks/1.json
  def show
  end

  # GET /company_facebooks/new
  def new
    @company_facebook = CompanyFacebook.new
  end

  # GET /company_facebooks/1/edit
  def edit
  end

  # POST /company_facebooks
  # POST /company_facebooks.json
  def create
    @company_facebook = CompanyFacebook.new(company_facebook_params)

    respond_to do |format|
      if @company_facebook.save
        format.html { redirect_to @company_facebook, notice: 'Company facebook was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company_facebook }
      else
        format.html { render action: 'new' }
        format.json { render json: @company_facebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_facebooks/1
  # PATCH/PUT /company_facebooks/1.json
  def update
    respond_to do |format|
      if @company_facebook.update(company_facebook_params)
        format.html { redirect_to @company_facebook, notice: 'Company facebook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company_facebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_facebooks/1
  # DELETE /company_facebooks/1.json
  def destroy
    @company_facebook.destroy
    respond_to do |format|
      format.html { redirect_to company_facebooks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_facebook
      @company_facebook = CompanyFacebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_facebook_params
      params.require(:company_facebook).permit(:fid, :company_name, :f_url, :f_likes, :company_description)
    end
end
