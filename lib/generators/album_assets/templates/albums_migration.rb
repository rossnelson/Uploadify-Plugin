class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
			t.string :filename
      t.text :desc
      t.timestamps
    end
		
		AdminMenuItem.create({:title =>"Albums", :controller_name => "albums", :url => "/albums"})
  end
  
  def self.down
    drop_table :albums
  end
end
