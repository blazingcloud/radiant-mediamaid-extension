 # Radiant-mediamaid-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #
class Admin::MediamaidController < ApplicationController
  
  def index
    @mediamaids = Mediamaid.all(:order=>"created_at DESC")
    @mediamaid = Mediamaid.new
  end
 
  def new
    @mediamaid = Mediamaid.new
  end
 
 
   def create
    @mediamaid = Mediamaid.create( params[:mediamaid] )
    respond_to do |format|
        if @mediamaid.save
         flash[:notice] = 'File was successfully loaded!'
         format.html { render :action => "show" }
        else
          format.html { render :action => "new" }
          format.xml { render :xml => @mediamaid.errors, :status => :unprocessable_entity }
        end
     end
  end
  
  
  def show
    @mediamaid = Mediamaid.find(params[:id])
 
    respond_to do |format|
      format.html
      format.xml { render :xml => @mediamaid }
    end
  end
  
  
  def remove
    @mediamaid = Mediamaid.find(params[:id])
    @mediamaid.destroy
 
    respond_to do |format|
      flash[:notice] = "Media was removed from Gallery."
      format.html { redirect_to(admin_mediamaid_index_url) }
    end
  end
  
end