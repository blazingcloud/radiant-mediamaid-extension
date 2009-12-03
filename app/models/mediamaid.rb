class Mediamaid < ActiveRecord::Base 
  require "paperclip"

    has_attached_file :mediamaid,   :styles => {
           :thumb => "100x100>"
     },   
      :whiny => false,
      :url  => "/assets/:id/:style/:basename.:extension", 
      :path => ":rails_root/public/assets/:id/:style/:basename.:extension" 



  
    validates_presence_of :mediamaid_file_name 
    validates_attachment_content_type :mediamaid, :content_type => [ 'image/jpeg', 'image/gif', 'image/png', 'audio/x-wav', 'application/x-wav', 'application/x-shockwave-flash', 'application/pdf' ]
    # validates_attachment_size :mediamaid, :less_than => 10.megabytes
 
    
  
end
