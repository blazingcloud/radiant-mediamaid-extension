 # Radiant-mediamaid-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #
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
    admin.tabs.add "Media", "/admin/mediamaid", :after => "Layouts", :visibility => [:all]

# default settings for configuration of medimaid image sizes, to change go to Settings in Admin UI
    Radiant::Config['mediamaid.thumb'] ||= "100x100"
    Radiant::Config['mediamaid.small'] ||= "200x200"
    Radiant::Config['mediamaid.medium'] ||= "300x300"
    Radiant::Config['mediamaid.large'] ||= "400x400"
    
  
    Admin::PagesController.class_eval do

      before_filter :set_custom_css

      def set_custom_css
        @stylesheets << 'admin/mediamaid'
      end
      
      # uncomment for 0.9, and remove JS tag from view
      #def include_javascript
      #  @javascripts << "admin/mediamaid.js"
      #end

    end
    
    Admin::MediamaidController.class_eval do

      before_filter :set_custom_css
     #before_filter :include_javascript

      def set_custom_css
        @stylesheets << 'admin/mediamaid'
      end
      

      #def include_javascript
      #  @javascripts << "admin/mediamaid.js"
      #end

    end
  end
end
