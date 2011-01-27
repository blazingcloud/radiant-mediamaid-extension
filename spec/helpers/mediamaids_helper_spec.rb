require 'spec_helper'

describe Admin::MediamaidHelper do
  describe "get_media" do
    before do
      mock_paperclip = mock_model(Paperclip::Attachment,:url => '/assets/1/thumb/patrick_cookie.jpg')
      @attr = {:mediamaid_file_name => 'patrick_cookie.jpg',
                              :mediamaid_content_type         => 'image/jpeg',
                              :mediamaid_file_size            => 7046,
                              :mediamaid                      => mock_paperclip}
      @mediamaid = mock_model(Mediamaid, @attr)
    end
    context "when clicking media thumbnail" do
      it "returns image media when content type is image/jpeg" do
        expected = "<img alt=\"#{@mediamaid.mediamaid_file_name}\" class=\"mediamaid_img image\" src=\"#{@mediamaid.mediamaid.url(:thumb)}\" />"
        helper.get_media(@mediamaid).should == expected
      end

      it "returns correct image tag when content type is an application/pdf" do
        @mediamaid.stub(:mediamaid_content_type => 'application/pdf')
        expected = "<img alt=\"#{@mediamaid.mediamaid.url(:thumb)}\" class=\"mediamaid_img\" src=\"/images/admin/gallery_pdf.jpg"
        helper.get_media(@mediamaid).should match(/#{expected}/)
      end

      it "returns correct image tag when content type is an application/wav" do
        @mediamaid.stub(:mediamaid_content_type => 'application/wav')
        expected = "<img alt=\"#{@mediamaid.mediamaid.url(:thumb)}\" class=\"mediamaid_img\" src=\"/images/admin/gallery_wav.jpg"
        helper.get_media(@mediamaid).should match(/#{expected}/)
      end

    end

    context "when clicking media link" do
      it "returns a tag when content type is media" do
        expected = "<a href=\"\" alt=\"#{@mediamaid.mediamaid_file_name}\" class=\"mediamaid_img image\">"
        expected += "#{@mediamaid.mediamaid_file_name}</a>"
        helper.get_media(@mediamaid, false).should == expected
      end

      it "returns <a> tag when content type is an application/pdf" do
        @mediamaid.stub!(:mediamaid_content_type => 'application/pdf')
        expected = "<a href=\"\" alt=\"#{@mediamaid.mediamaid.url(:thumb)}\" class=\"mediamaid_img\">#{@mediamaid.mediamaid_file_name}</a>"
        helper.get_media(@mediamaid, false).should  == expected
      end

      it "returns <a> tag when content type is an application/wav" do
        @mediamaid.stub!(:mediamaid_content_type => 'application/wav')
        expected = "<a href=\"\" alt=\"#{@mediamaid.mediamaid.url(:thumb)}\" class=\"mediamaid_img\">#{@mediamaid.mediamaid_file_name}</a>"
        helper.get_media(@mediamaid, false).should  == expected
      end
    end
  end
end
