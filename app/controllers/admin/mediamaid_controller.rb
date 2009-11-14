class Admin::MediamaidController  < ApplicationController
  # GET /Medias
  # GET /Medias.xml
  def index
    @mediamaids = Mediamaid.all
   
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @mediamaids }
    # end
  end
  
  # GET /Medias/new
  # GET /Medias/new.xml
  def new
    @mediamaid = Mediamaid.new
  end
  # POST /Medias
  # POST /Medias.xml
  def create 
    @mediamaid = Mediamaid.create( params[:mediamaid] )
 
    respond_to do |format|
      if @mediamaid.save
        flash[:notice] = 'Mediamaid was successfully created.'
        format.html { redirect_to(@mediamaid) }
        format.xml  { render :xml => @mediamaid, :status => :created, :location => @mediamaid }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mediamaid.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
