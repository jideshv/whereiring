class MomsgsController < ApplicationController
  # GET /momsgs
  # GET /momsgs.json
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "" && password == ""
    end
  end

  def index
    @momsgs = Momsg.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @momsgs }
    end
  end

  # GET /momsgs/1
  # GET /momsgs/1.json
  def show
    @momsg = Momsg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @momsg }
    end
  end

  # GET /momsgs/new
  # GET /momsgs/new.json
  def new
    @momsg = Momsg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @momsg }
    end
  end

  # GET /momsgs/1/edit
  def edit
    @momsg = Momsg.find(params[:id])
  end

  # POST /momsgs
  # POST /momsgs.json
  def create
    #ClickATell posts this
    #Parameters:
    #"api_id"=>"3306957"
    #"from"=>"886975395038"
    #"to"=>"41798070085"
    #"timestamp"=>"2011-09-19 13:02:52"
    #"text"=>"Test of SMS 2"
    #"charset"=>"ISO-8859-1"
    #"udh"=>""
    #"moMsgId"=>"3e644dd7c1df98671fe41d26dfd73672"

    @momsg = Momsg.new(:from => params[:from], :text => params[:text])
    
    @momsg.save

    respond_to do |format|
        format.html { redirect_to @momsg }
    end
  end

  # PUT /momsgs/1
  # PUT /momsgs/1.json
  def update
    @momsg = Momsg.find(params[:id])

    respond_to do |format|
      if @momsg.update_attributes(params[:momsg])
        format.html { redirect_to @momsg, notice: 'Momsg was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @momsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /momsgs/1
  # DELETE /momsgs/1.json
  def destroy
    @momsg = Momsg.find(params[:id])
    @momsg.destroy

    respond_to do |format|
      format.html { redirect_to momsgs_url }
      format.json { head :ok }
    end
  end
end
