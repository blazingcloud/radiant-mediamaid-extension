# Radiant-mediamaid-extension
# @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
# @license MIT License
#
require File.dirname(__FILE__) + "/../../spec_helper"

describe Admin::MediamaidController do
  integrate_views

  before(:each) do
    # sets up a dummy  mediamaid record
    @attr         = {:mediamaid_file_name   => "patrick_cookie.jpg",
                     :mediamaid_content_type=> "image/jpeg",
                     :mediamaid_file_size   => 10}

    @mediamaid    = mock_model(Mediamaid)

    # sets up access to admin pages
    @current_user = mock_model(User, :locale => nil, :name => "Liah", :admin => 1)
    controller.stub!(:current_user).and_return(@current_user)
    @current_user.stub!(:has_role?).and_return(true)
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

      post :create, :mediamaid => @attr
      flash[:notice].should == "File was successfully loaded!"
      response.should have_tag("h3", :text=>"patrick_cookie.jpg Information")

    end
    it "should display errors after a failed upload when file is empty  " do
      media = mock_model(Mediamaid,  :mediamaid_file_name => 'blah.jpg')
      Mediamaid.should_receive(:new).and_return(media)
      media.stub(:save).and_return(false)
      post :create
      media.errors.should_not be_nil
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

  describe 'gallery' do
    it 'should show render gallery info' do
      get :gallery
      assigns[:mediamaids].should_not be_nil
      response.should render_template 'admin/pages/gallery_info'
    end
  end

end
  
  