class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end
  
  def show
    @photo = Photo.find(params[:id], :include => :album)
		@total_uploads = Photo.find(:all, :conditions => { :album_id => @photo.album.id})
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
		newparams = coerce(params)
    @photo = Photo.new(newparams[:photo])
    if @photo.save
      flash[:notice] = "Successfully created photo."
      respond_to do |format|
        format.html { redirect_to @photo.album }
        format.json { render :json => { :result => 'success', :photo => photo_url(@photo) } }
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to @photo
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to photos_url
  end

	private
  def coerce(params)
    if params[:photo].nil?
      h = Hash.new
      h[:photo] = Hash.new
      h[:photo][:album_id] = params[:album_id]
      h[:photo][:file] = params[:Filedata]
      h[:photo][:file].content_type = MIME::Types.type_for(h[:photo][:file].original_filename).to_s
      h
    else
      params
    end
  end

end
