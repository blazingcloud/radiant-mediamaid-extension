ActionController::Routing::Routes.draw do |map|
  map.namespace 'admin', :member => { :remove => :get} do |admin|
    admin.resources :mediamaid,
      :collection => {:gallery => :get}
  end

#  map.gallery '/admin/mediamaid/gallery', :action => "gallery", :controller => 'mediamaids', :method => :get
end