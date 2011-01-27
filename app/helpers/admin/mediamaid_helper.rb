module Admin::MediamaidHelper
  def get_media(media, isthumb=true)
    if media

      html_options = {:alt => media.mediamaid_file_name, :class => 'mediamaid_img'}

      if media.mediamaid_content_type.match(/image/)
        image_path = media.mediamaid.url(:thumb)
        html_options.merge!(:class => 'mediamaid_img image')
      else
        extension  = media.mediamaid_content_type.split('/')[1]
        image_path = "/images/admin/gallery_#{extension}.jpg"
        html_options.merge!(:alt => media.mediamaid.url(:thumb))
      end

      if isthumb
        image_tag image_path, html_options
      else
        link_to media.mediamaid_file_name, "", html_options
      end

    end
  end
end