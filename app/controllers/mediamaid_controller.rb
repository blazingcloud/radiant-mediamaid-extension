class MediamaidController  < ApplicationController
  # GET /Medias
  # GET /Medias.xml
  def index
    @medias = Media.all

    respond_tdControllero do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medias }
    end
  end

end
