class Mediamaid < ActiveRecord::Base 
  require "paperclip"

  has_attached_file :mediamaid, :styles => { 
      :thumb => "100x100>",
      :small => "150x150>", 
      :medium => "200x200>", 
      :large => "400x400>" 
    },   
    :url  => "/assets/products/:id/:style/:basename.:extension", 
    :path => ":rails_root/public/assets/:id/:style/:basename.:extension"
   
   
  validates_attachment_presence :mediamaid
  validates_attachment_content_type :mediamaid, :content_type => 'image/jpeg'
  validates_attachment_content_type :mediamaid, :content_type =>  'image/gif'
  validates_attachment_content_type :mediamaid, :content_type =>  'image/png'
 
end
