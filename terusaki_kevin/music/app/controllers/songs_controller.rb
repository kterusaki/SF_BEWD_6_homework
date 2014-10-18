class SongsController < ApplicationController
	def index
		@artist = Artist.find(params[:artist_id])
		@songs = @artist.songs.all
	end

	def new
		@artist = Artist.find(params[:artist_id])
		@song = Song.new
	end

	def create
		@artist = Artist.find(params[:artist_id])
		@song = @artist.song.new(song_params)

		if @song.save
			redirect_to artist_songs_path(@artist)
		else
			render 'new'
		end
	end

	private

	def song_params
		params.require(:song).permit(:track, :time, :genre)
	end
end
