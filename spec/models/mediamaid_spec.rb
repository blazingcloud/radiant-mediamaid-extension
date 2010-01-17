 # Radiant-mediamaid-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License

require File.dirname(__FILE__) + "/../spec_helper"

# Another requirement is to make sure whiny = true, to do this the content-types tests 
# will capture whiny, because if whiny is off, the WAV content-type will not be created 
# and in that regard, all non-image content-types, and anything ImageMagick can't manipulate
# actually don't think that's true now- will need to check whiny is off

describe Mediamaid do
   before(:each) do
       @mediamaid = Mediamaid.new
       @mediamaid.mediamaid_file_name="sample.gif"
       @mediamaid.mediamaid_content_type = "image/gif"
   end
  
  it "should be invalid if mediamaid file name is nil" do
    @mediamaid.mediamaid_file_name = ""
    @mediamaid.should_not be_valid
  end
  
  it "should upload gifs" do
    @mediamaid.mediamaid_content_type = "image/gif"
    @mediamaid.should be_valid
  end

  it "should upload jpegs" do
    @mediamaid.mediamaid_content_type = "image/jpeg"
    @mediamaid.should be_valid
  end
  
  it "should upload pdf" do
    @mediamaid.mediamaid_content_type = "application/pdf"
    @mediamaid.should be_valid
  end
  
  it "should upload png" do
    @mediamaid.mediamaid_content_type = "image/png"
    @mediamaid.should be_valid
  end
  
  it "should upload flash" do
    @mediamaid.mediamaid_content_type = "application/x-shockwave-flash"
    @mediamaid.should be_valid
  end
  
  
  it "should be invalid if mediamaid content type is mp3" do
    @mediamaid.mediamaid_content_type = "audio/mp3"
    @mediamaid.should_not be_valid
  end
end
