require File.dirname(__FILE__) + "/../../spec_helper"

describe Admin::MediamaidController do
  integrate_views
  
  before(:each) do
    @mediamaid = mock_model(Mediamaid)

    @current_user = mock_model(User)
    controller.stub!(:current_user).and_return(@current_user)
    @current_user.stub!(:admin?).and_return(true)
  end

  describe 'remove' do

    
   it "should remove an image" do
     
     Mediamaid.should_receive(:find).with("37").and_return(@mediamaid)
     Mediamaid.find("37")
     Mediamaid.should_receive(:destroy).with("37").and_return(true)
     Mediamaid.destroy("37")
     flash.now[:notice].should != nil
     response.should redirect_to(admin_mediamaid_index_url)
    end
  end
end
  
  