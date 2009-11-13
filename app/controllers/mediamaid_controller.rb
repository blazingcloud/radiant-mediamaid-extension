class MediamaidController  < ApplicationController
  # GET /Medias
  # GET /Medias.xml
  def index
    @mediamaids = Mediamaid.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mediamaids }
    end
  end

end
