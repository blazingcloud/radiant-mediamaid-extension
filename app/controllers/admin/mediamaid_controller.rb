class Admin::MediamaidController  < ApplicationController
  
  def index
    @mediamaids = Mediamaid.all 
  end 

  def new
    @mediamaid = Mediamaid.new
  end

<<<<<<< HEAD
   # def create 
   #  @mediamaid = Mediamaid.create( params[:mediamaid] )
   #  render :layout => false
   #  if (request.xhr?)
   #    flash[:notice] = 'Was an Ajax call.'
   #  else
   #    flash[:notice] = 'Was not an Ajax call.'
   #  end
   # respond_to do |format|
  #   flash[:notice] = 'File was successfully loaded!'   
   #  format.html { render :action => "show" }
   # end
    # end
   
   def create
     @mediamaid = Mediamaid.new(params[:mediamaid])
     respond_to do |format|
       if @mediamaid.save
         flash[:notice] = 'Mediamaid was successfully created.'
         format.html { redirect_to mediamaid_url(@mediamaid) }
         format.xml  { head :created, :location => mediamaid_url(@mediamaid) }
         format.js do
           responds_to_parent do
             render :update do |page|
               page.insert_html :bottom, "mediamaids", :partial => 'mediamaids/list_item', :object => @mediamaid
               page.visual_effect :highlight, "mediamaid_#{@mediamaid.id}" 
             end
           end          
         end
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @mediamaid.errors.to_xml }
         format.js do
           responds_to_parent do
             render :update do |page|
                 # update the page with an error message
             end
           end          
         end
       end
     end
   end
   
   
   
 
=======
   def create 
    @mediamaid = Mediamaid.create( params[:mediamaid] )
    respond_to do |format|
       flash[:notice] = 'File was successfully loaded!'   
       format.html { render :action => "show" }
     end
  end
>>>>>>> 57ea9dca85215e44b685d7731c5564dc456a2a1c
  
  
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
