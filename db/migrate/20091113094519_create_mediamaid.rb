 # Radiant-carousel-extension
 # @copyright (c) 2010 Blazing CLoud (http://www.blazingcloud.net)
 # @license MIT License
 #
 class CreateMediamaid < ActiveRecord::Migration
  def self.up
    create_table :mediamaids do |t|
    t.string :mediamaid_file_name
    t.string :mediamaid_content_type
    t.integer :mediamaid_file_size
    t.timestamps
    end
  end

  def self.down
    drop_table :mediamaids
  end
end


