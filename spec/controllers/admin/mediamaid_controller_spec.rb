 # Radiant-mediamaid-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 # 
require File.dirname(__FILE__) + "/../../spec_helper"

describe Admin::MediamaidController do
  integrate_views
  
  before(:each) do
    # sets up a dummy  mediamaid record
    @mediamaid = mock_model(Mediamaid)

    # sets up access to admin pages
    @current_user = mock_model(User)
    controller.stub!(:current_user).and_return(@current_user)
    @current_user.stub!(:admin?).and_return(true)
  end
  
  describe "index" do
    it "should show all mediamaid items" do
      get :index
      response.should be_success
    end
  end

  describe "show" do
    it "should show individual media on index page" do
      Mediamaid.should_receive(:find).with("37").and_return(@mediamaid)
      Mediamaid.find("37")

    end
    
    it "should go to index if no photo provided" do
      Mediamaid.should_receive(:find).with().and_return(false)
      Mediamaid.find()
    end

    it "should redirect to show after clicking upload if upload is successful"
    it "should redirect to show after clicking upload if upload fails"
    it "should redirect to show page after clicking on an image"
    it "should show available sizes on show page"
 

  end
  
  describe "create" do
    it "should create new media object and flash success, and show image" do
      Mediamaid.mediamaid_file_name = "patrick_cookie.JPG"
    #  Mediamaid.should_receive(:create).with("30").and_return(@mediamaid)
    #  Mediamaid.create("30")
    #  Mediamaid.should_receive(:create).with("30").and_return(@mediamaid)
    #  Mediamaid.create(:mediamaid_file_name=>"patrick_cookie.JPG")
      flash.now[:notice].should != nil #known issue re: knowing/comparing flash contents
      response.should have_tag("h3", :text=>"patrick_cookie.JPG Information")  

    end
    it "should show errors after a failed upload" do
      Mediamaid.should_receive(:create).with().and_return(false)
      Mediamaid.create()
      flash.now[:notice].should != nil #known issue re: knowing/comparing flash contents     
    end
  end


  describe 'remove' do
    
   it "should remove an image" do
     
     Mediamaid.should_receive(:find).with("37").and_return(@mediamaid)
     Mediamaid.find("37")
     Mediamaid.should_receive(:destroy).with("37").and_return(true)
     Mediamaid.destroy("37")
    flash.now[:notice].should != nil
    end
  end
end
  
  