class AlbumsController < ApplicationController

	def index
	  @user = User.find(params[:user_id])
	  @albums = @user.albums.all

	  respond_to do |format|
	  	format.html
	  	format.json { render json: @albums }
	  end
	end

	def show
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:id])
	end

	def update
	end

	def edit
	end

	def create
	  @user = User.find(params[:user_id])
	  @album = @user.albums.build(params[:album])
	  respond_to do |format|
		if @user.save
		  format.html { redirect_to user_album_path(@user, @album), notice: 'Album was successfully created.' }
	   	  format.json { render json: @album, status: :created, location: @album}
		else
		  format.html { render action: "new" }
		  format.json { render json: @album.errors, status: :unprocessable_entity }
		end
	  end 
	end

	def new
	  @user = User.find(params[:user_id])
	  @album = Album.new
	end

	def destroy
	end


end
