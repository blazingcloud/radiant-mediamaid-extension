require File.dirname(__FILE__) + "/../../spec_helper"

describe Admin::MediamaidController do
  
  before do
    @mediamaid = Mediamaid.new
  end

 it "should flash a notice after removing an image" do
   delete :destroy, :id => @mediamaid.id
    response.should flash[:notice]
  end
  
  
  
end