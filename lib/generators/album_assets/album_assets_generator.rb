class AlbumAssetsGenerator < Rails::Generator::Base
	def self.source_root
		@source_root ||= File.join(File.dirname(__FILE__), 'templates')
	end

  def manifest
    record do |m|
      m.migration_template 'albums_migration.rb', "db/migrate", {:migration_file_name => "create_albums"}
      m.sleep 1 # not ideal, but makes sure the timestamps differ
      m.migration_template 'photos_migration.rb', "db/migrate", {:migration_file_name => "create_photos"}
			m.sleep 1 # not ideal, but makes sure the timestamps differ
      m.migration_template 'photos_file_migration.rb', "db/migrate", {:migration_file_name => "add_attachments_file_to_photo"}
					
			m.file "initializers/flash_session_cookie_middleware.rb", "config/initializers/flash_session_cookie_middleware.rb"
			m.file "initializers/session_store_middleware.rb", "config/initializers/session_store_middleware.rb"
			
			m.directory "public/javascripts/uploadify"
			
			m.file "uploadify/jquery.uploadify.v2.1.0.js", "public/javascripts/uploadify/jquery.uploadify.v2.1.0.js"
			m.file "uploadify/swfobject.js", "public/javascripts/uploadify/swfobject.js"
			m.file "uploadify/uploadify.swf", "public/javascripts/uploadify/uploadify.swf"	

			m.file "images/cancel.png", "public/images/cancel.png"
			m.file "dust_album.css", "public/stylesheets/dust_album.css"
			m.file "jquery-1.4.2.js", "public/javascripts/jquery-1.4.2.js"
			m.file "uploadify.css", "public/stylesheets/uploadify.css"
			
    end
  end
end
