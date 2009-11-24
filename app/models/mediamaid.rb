class Mediamaid < ActiveRecord::Base 
   require "paperclip"
  has_attached_file :mediamaid, :styles => { 
    # :thumb => Proc.new { |instance| "#{instance.photo_width}x#{instance.photo_height}>" },
    
    # convert logo: -resize 80x80\> \
      # -size 80x80 xc:blue +swap -gravity center  -composite \
      # space_resize.jpg
    
    # :thumb => "-resize 100x100> -size 100x100 xc:blue +swap -gravity center  -composite ", 
    :thumb => "100x100>",
    :small => "150x150>", 
    :medium => "200x200>", 
    :large => "400x400>" },   
    :url  => "/assets/products/:id/:style/:basename.:extension", 
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension", 
    :commands => { :thumb => "-background white -gravity center -extent 100x100 +repage" }
  


end
