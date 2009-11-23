class Mediamaid < ActiveRecord::Base 
   require "paperclip"
  has_attached_file :mediamaid, :styles => { :thumb => "100x100>", :small => "150x150>", :medium => "200x200>", :large => "400x400>" },   :url  => "/assets/products/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension",  
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "100x100>" },
     :commands => { :thumb => "-background white -gravity center -extent 100x100 +repage" }
  


end
