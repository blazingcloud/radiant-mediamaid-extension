class Admin::MediamaidController  < ApplicationController
  layout "standard", :except => [:create ]
  
  def index
    @mediamaids = Mediamaid.all 
  end 

  def new
    @mediamaid = Mediamaid.new
  end

   def create 
    @mediamaid = Mediamaid.create( params[:mediamaid] )
    render :layout => false
    if (request.xhr?)
      flash[:notice] = 'Was an Ajax call.'
    else
      flash[:notice] = 'Was not an Ajax call.'
    end
   # respond_to do |format|
  #   flash[:notice] = 'File was successfully loaded!'   
   #  format.html { render :action => "show" }
   # end
  end
  
  
  def show
    @mediamaid = Mediamaid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mediamaid }
    end
  end
  
  def me
    flash[:notice] = "Hi!"
  end

  
    def destroy
    @mediamaid = Mediamaid.find(params[:id])
    @mediamaid.destroy

    respond_to do |format|
      flash[:notice] = "Media was removed from Gallery."
      format.html { render :action => "index" }
    end
  end
  
  
end
