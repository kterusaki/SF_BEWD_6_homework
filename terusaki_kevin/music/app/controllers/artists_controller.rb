class ArtistsController < ApplicationController
	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)

		if params[:artist][:label] != ""
			@artist.label_id = params[:artist][:label].to_i
		end

		if @artist.save
			redirect_to artist_path(@artist)
		else
			render 'new'
		end
	end

	def show
		@artist = Artist.find(params[:id])

		if (@artist.label_id)
			@label = Label.find(@artist.label_id)
		else
			@label = nil
		end
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])

		if params[:artist][:label] != ""
			@artist.label_id = params[:artist][:label].to_i
		end

		if @artist.update(artist_params)
			redirect_to @artist
		else
			render 'edit'
		end
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy

		redirect_to artists_path
	end

	def label_name

	end

	private

	def artist_params
		params.require(:artist).permit(:name, :age, :image)
	end
end
