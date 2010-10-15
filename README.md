Generate a rails app add this to the environment.rb
	
	config.gem 'mime-types', :lib => 'mime/types'
	config.gem 'paperclip'
	config.gem 'nifty_scaffolds'
	
then run
	
	script/generate nifty_layout
	
and

	rake db:migrate