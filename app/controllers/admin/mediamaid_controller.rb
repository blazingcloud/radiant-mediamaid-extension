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
end
