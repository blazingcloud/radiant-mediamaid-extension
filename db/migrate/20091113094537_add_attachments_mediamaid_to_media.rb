class AddAttachmentsMediamaidToMedia < ActiveRecord::Migration
  def self.up
    add_column :media, :mediamaid_file_name, :string
    add_column :media, :mediamaid_content_type, :string
    add_column :media, :mediamaid_file_size, :integer
  end

  def self.down
    remove_column :media, :mediamaid_file_name
    remove_column :media, :mediamaid_content_type
    remove_column :media, :mediamaid_file_size
  end
end
