class ViewAlbumsController < ApplicationController
  def index
		@albums = Album.all
  end

  def show
		if Album.find_by_filename(params[:filename]) == nil
			@album = Album.find(:first)
			render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
		else
			@album = Album.find_by_filename(params[:filename])
		end
  end

end
