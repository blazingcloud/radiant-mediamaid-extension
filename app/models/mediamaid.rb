class Mediamaid < ActiveRecord::Base 
   require "paperclip"
  has_attached_file :mediamaid, :styles => { :thumb => ["100x100#",:png], :small => "150x150>", :large => "400x400>" }, :url  => "/assets/products/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"  
end
