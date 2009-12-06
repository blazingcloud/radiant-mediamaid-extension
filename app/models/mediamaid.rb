class Mediamaid < ActiveRecord::Base 
  require "paperclip"

  thumb_size = "'" + Radiant::Config['mediamaid_thumb'] + ">'"
    has_attached_file :mediamaid,   :styles => {
           :thumb => thumb_size
     },   
      :whiny => false,
      :url  => "/assets/:id/:style/:basename.:extension", 
      :path => ":rails_root/public/assets/:id/:style/:basename.:extension",
      :default_url => "/:class/:attachment/missing_:style.png"

  
    validates_presence_of :mediamaid_file_name 
    validates_attachment_content_type :mediamaid, :content_type => [ 'image/jpeg', 'image/gif', 'image/png', 'audio/x-wav', 'application/x-wav', 'application/x-shockwave-flash', 'application/pdf' ]
    # validates_attachment_size :mediamaid, :less_than => 10.megabytes
 
    
  
end

      
      
      
      