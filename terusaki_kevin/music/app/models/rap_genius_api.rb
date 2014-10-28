module RapGeniusApi
	def self.getArtistInfo(name)
		search = RapGenius.search_by_artist(name)
		artist = search.first.artist
	end

	def self.getSongs(name)
		search = RapGenius.search_by_artist(name)
		songs = search.map(&:id)
		songs.each do |song_id|
			RapGenius::Song.find(song_id)
		end
	end

	def self.getSongInfo(song_id)
		song_info = RapGenius::Song.find(song_id)
	end

	# Returns an array of lyrics of a song
	def self.getLyrics(song_id)
		song_info = RapGenius::Song.find(song_id)
		lines = song_info.lines

		lyrics = []
		lines.each do |line|
			lyrics.push(line.lyric)
		end

		return lyrics
	end

	def self.getMediaUrl(song_id)
		song_info = getSongInfo(song_id)

		media = song_info.media.first.url 
	end
end