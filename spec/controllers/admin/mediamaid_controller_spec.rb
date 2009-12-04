require File.dirname(__FILE__) + "/../../spec_helper"

describe Admin::MediamaidController do
  
  before do
    @mediamaid = Mediamaid.new
  end

 it "should flash a notice after removing an image" do
   delete :destroy, :id => @mediamaid.id
    response.should flash[:notice]
  end
  #mediamaid controller
  it "should redirect to show after clicking upload if upload is successful"
  it "should redirect to show after clicking upload if upload fails"
  it "should show all images on the index page"
  it "should show errors after a failed upload"
  it "should redirect to show page after clicking on an image"
  it "should show avaliable sizes on show page"
  #pages view
  it "should show gallery when 'view images' is clicked"
end