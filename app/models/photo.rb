class Photo < ActiveRecord::Base
  attr_accessible :title, :desc, :date_shot, :location, :album_id, :file
	belongs_to :album
	has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
