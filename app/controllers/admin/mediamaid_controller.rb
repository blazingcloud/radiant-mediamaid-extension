class Admin::MediamaidController  < ApplicationController
  def index
    @mediamaids = Mediamaid.all 
  end 

  def new
    @mediamaid = Mediamaid.new
  end

   def create 
    @mediamaid = Mediamaid.create( params[:mediamaid] )
    respond_to do |format|
       flash[:notice] = 'File was successfully loaded!'
       format.html { render :action => "show" }
    end
  end
  
  
  def show
    @mediamaid = Mediamaid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediamaid }
    end
  end
end
