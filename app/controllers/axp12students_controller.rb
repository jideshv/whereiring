require 'mechanize'

class Axp12studentsController < ApplicationController
  before_filter :authenticate
  caches_action :sendsms 
  caches_action :sentsms
  helper :layout
  layout :choose_layout
  
  # GET /axp12students
  # GET /axp12students.json
  def index
    @axp12students = Axp12student.all_cached
    @stats = Rails.cache.stats.first.last
    if @stats == nil
      @stats = Hash.new
      @stats['get_hits'] = 'no stats'
      @stats['get_misses'] = 'no stats'
      @stats['cmd_flush'] = 'no stats'
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @axp12students }
    end
  end
  
  # GET /axp12students/sendsms
  def sendsms
     respond_to do |format|
       format.html # sendsms.html.erb 
     end
  end
  
  # POST /axp12students/sentsms
  def sentsms
    @axp12students = Axp12student.all_cached
    #@inputparams = params
    @sendsms =  Sendsms.new
    
    @sendsms.message = params[:ssfm]
    @sendsms.delay = params[:ssfd]
    @sendsms.numberlist = ''
    numstudents = @axp12students.length
    @axp12students.each_with_index do |axp12student,index|
      @sendsms.numberlist << axp12student.mobile
      if index != numstudents-1
        @sendsms.numberlist << ','
      end
    end
    
    @data = {
      "user" => "",
      "password" => "",
      "api_id"=> "",
      "to" => @sendsms.numberlist,
      "text" => "FROM AXP12 SAC:"+@sendsms.message,
      "deliv_time" => @sendsms.delay.to_s
    }

    url = 'https://api.clickatell.com/http/sendmsg';
    
    agent = Mechanize.new
    agent.user_agent = 'WhereIRing/0.1'
    @resp = agent.post(url,@data)

    respond_to do |format|
        format.html { redirect_to axp12students_url, notice: 'SMS Sent' }
    end
  end

  # GET /axp12students/1
  # GET /axp12students/1.json
  def show
    @axp12student = Axp12student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @axp12student }
    end
  end

  # GET /axp12students/new
  # GET /axp12students/new.json
  def new
    @axp12student = Axp12student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @axp12student }
    end
  end

  # GET /axp12students/1/edit
  def edit
    @axp12student = Axp12student.find(params[:id])
  end

  # POST /axp12students
  # POST /axp12students.json
  def create
    @axp12student = Axp12student.new(params[:axp12student])
    cacheclear

    respond_to do |format|
      if @axp12student.save
        format.html { redirect_to axp12students_url, notice: 'Notification Number for ' + @axp12student.name + ' added.' }
        format.json { render json: @axp12student, status: :created, location: @axp12student }
      else
        format.html { render action: "new" }
        format.json { render json: @axp12student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /axp12students/1
  # PUT /axp12students/1.json
  def update
    @axp12student = Axp12student.find(params[:id])
    cacheclear

    respond_to do |format|
      if @axp12student.update_attributes(params[:axp12student])
        format.html { redirect_to axp12students_url, notice: 'Notification Number for ' + @axp12student.name + ' updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @axp12student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /axp12students/1
  # DELETE /axp12students/1.json
  def destroy
    @axp12student = Axp12student.find(params[:id])
    @axp12student.destroy
    cacheclear
    
    respond_to do |format|
      format.html { redirect_to axp12students_url }
      format.json { head :ok }
    end
  end
  
  private
  def choose_layout    
      'sms'
  end
  
  def cacheclear
    expire_action :action => :sendsms
    expire_action :action => :sentsms
    expire_fragment :action => :index, :action_suffix => "all_students"
  end
  
  def authenticate
    store_target_location
    check_login_and_role "axp12sac"
  end
end
