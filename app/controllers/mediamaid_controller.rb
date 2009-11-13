class MediaController < ApplicationController
  # GET /Medias
  # GET /Medias.xml
  def index
    @medias = Media.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medias }
    end
  end

end
