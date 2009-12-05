class MediamaidExtension < Radiant::Extension
  version "1.0"
  description "MediaMaid is an asset management tool for Radiant CMS"
  url "http://blazing-cloud.com"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :mediamaid
    end
  end
  
  def activate
    admin.page.edit.add(:form, "mediamaid_gallery", :before=> "edit_page_parts")
#    admin.page.edit.add(:main, "mediamaid_gallery", :after => "edit_title")
    admin.tabs.add "Media", "/admin/mediamaid", :after => "Layouts", :visibility => [:all]
     

    Admin::PagesController.class_eval do

      before_filter :set_custom_css
      #before_filter :include_javascript

      def set_custom_css
        @stylesheets << 'admin/mediamaid'
      end
      
      # uncomment for 0.9, and remove JS tag from view
      #def include_javascript
      #  @javascripts << "admin/insert_text_into_textarea.js"
      #end

    end
    
    Admin::MediamaidController.class_eval do

      before_filter :set_custom_css
     #before_filter :include_javascript

      def set_custom_css
        @stylesheets << 'admin/mediamaid'
      end
      

      #def include_javascript
      #  @javascripts << "admin/insert_text_into_textarea.js"
      #end

    end
  end
end
