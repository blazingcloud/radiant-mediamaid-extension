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
  
  def destroy
    
    @mediamaid = Mediamaid.find(params[:id])
    @mediamaid.destroy

    # respond_to do |format|
    #   format.html { redirect_to(Mediamaids_url) }
    #   format.xml  { head :ok }
    # end
  end
  
  # def update
  #   @media = Media.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @media.update_attributes(params[:Media])
  #       flash[:notice] = 'Media was successfully updated.'
  #       format.html { redirect_to(@media) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
end
