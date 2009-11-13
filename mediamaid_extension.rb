# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class MediamaidExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/mediamaid"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :mediamaid
    end
  end
  
  def activate
    # admin.nav[:content] << admin.nav_item(:mediamaid, "Mediamaid", "/admin/mediamaid"), :after => :pages
    admin.tabs.add "Media Maid", "/admin/mediamaid", :after => "Layouts", :visibility => [:all]
  end
end
