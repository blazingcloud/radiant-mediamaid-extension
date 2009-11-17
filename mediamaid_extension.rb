# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

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
    admin.page.edit.add(:main, "mediamaid_gallery", :before => "edit_header")
    # admin.nav[:content] << admin.nav_item(:mediamaid, "Mediamaid", "/admin/mediamaid"), :after => :pages
    admin.tabs.add "Media Maid", "/admin/mediamaid", :after => "Layouts", :visibility => [:all]
#     tab("Design").add_item "Media Maid", "/admin/mediamaid", :after => "Stylesheets"

  end
end
