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

  # GET /Medias/1
  # GET /Medias/1.xml
  def show
    @media = Media.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /Medias/new
  # GET /Medias/new.xml
  def new
    @media = Media.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /Medias/1/edit
  def edit
    @media = Media.find(params[:id])
  end

  # POST /Medias
  # POST /Medias.xml
  def create 
    @media = Media.create( params[:Media] )
 
    respond_to do |format|
      if @media.save
        flash[:notice] = 'Media was successfully created.'
        format.html { redirect_to(@media) }
        format.xml  { render :xml => @media, :status => :created, :location => @media }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Medias/1
  # PUT /Medias/1.xml
  def update
    @media = Media.find(params[:id])

    respond_to do |format|
      if @media.update_attributes(params[:Media])
        flash[:notice] = 'Media was successfully updated.'
        format.html { redirect_to(@media) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Medias/1
  # DELETE /Medias/1.xml
  def destroy
    @media = Media.find(params[:id])
    @media.destroy

    respond_to do |format|
      format.html { redirect_to(Medias_url) }
      format.xml  { head :ok }
    end
  end
end
