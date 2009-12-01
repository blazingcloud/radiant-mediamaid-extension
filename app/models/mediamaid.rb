class Mediamaid < ActiveRecord::Base 
   require "paperclip"
  has_attached_file :mediamaid, :styles => { 
    :thumb => "100x100>",
    :small => "150x150>", 
    :medium => "200x200>", 
    :large => "400x400>" },   
    :url  => "/assets/:id/:style/:basename.:extension", 
    :path => ":rails_root/public/assets/:id/:style/:basename.:extension"
  
    validates_presence_of :mediamaid_file_name 
 
end
