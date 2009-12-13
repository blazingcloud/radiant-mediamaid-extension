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

  describe "show" do
    it "should show individual media on index page" do
      Mediamaid.should_receive(:find).with("37").and_return(@mediamaid)
      Mediamaid.find("37")
      # how to show that it's drawing to the index page with this mediamaid info? in views?
    end

    it "should show available sizes on show page"
    # should probably be done in view testing
  end
  
  describe "create" do
    it "should create new media object" do
      Mediamaid.should_receive(:create).with("30").and_return(@mediamaid)
      Mediamaid.create("30")
      flash.now[:notice].should != nil #known issue re: knowing/comparing flash contents
      response.should render_template(admin_mediamaid_url("30")) #how to pass id?
    end
  end


  describe 'remove' do
    
   it "should remove an image" do
     
     Mediamaid.should_receive(:find).with("37").and_return(@mediamaid)
     Mediamaid.find("37")
     Mediamaid.should_receive(:destroy).with("37").and_return(true)
     Mediamaid.destroy("37")
    flash.now[:notice].should != nil
    # known issue with rails not being able to show flash msg contents
    # there's a fix that involves editing specs.rb
#     response.should redirect_to(admin_mediamaid_index_url)
    end
  end
end
  
  