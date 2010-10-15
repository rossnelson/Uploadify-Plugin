ActionController::Routing::Routes.draw do |map|
	map.resources :photos
  map.resources :albums

	map.view_albums 'all/albums', :controller => 'view_albums', :action => 'index'
	map.view_album ':filename', :controller => 'view_albums', :action => 'show'
end
