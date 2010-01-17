 # Radiant-mediamaid-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #
class Mediamaid < ActiveRecord::Base 
  require "paperclip"

  thumb_size  =  Radiant::Config['mediamaid.thumb'] + ">"
  small_size  = Radiant::Config['mediamaid.small'] + ">"
  medium_size = Radiant::Config['mediamaid.medium'] + ">"
  large_size  = Radiant::Config['mediamaid.large'] + ">"
    has_attached_file :mediamaid,   :styles => {
           :thumb => thumb_size,
           :small => small_size,
           :medium => medium_size,
          :large => large_size
     },   
      :whiny => false,
      :url  => "/assets/:id/:style/:basename.:extension", 
      :path => ":rails_root/public/assets/:id/:style/:basename.:extension",
      :default_url => "/:class/:attachment/missing_:style.png"

  
    validates_presence_of :mediamaid_file_name 
    validates_attachment_content_type :mediamaid, :content_type => [ 'image/jpeg', 'image/gif', 'image/png', 'audio/x-wav', 'application/x-wav', 'application/x-shockwave-flash', 'application/pdf' ]
    # validates_attachment_size :mediamaid, :less_than => 10.megabytes
 
    
  
end

      
      
      
      