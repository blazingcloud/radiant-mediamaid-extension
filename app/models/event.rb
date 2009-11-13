class Event < ActiveRecord::Base
require "paperclip"
belongs_to :user
# validates_presence_of :title, :on => :create, :message => "can't be blank"
# validates_presence_of :teaser, :on => :create, :message => "can't be blank"
# validates_presence_of :subject, :on => :create, :message => "can't be blank"
# # Paperclip
has_attached_file :photo,
  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "400x400>" }
end