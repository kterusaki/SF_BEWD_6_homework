class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :track
      t.string :time
      t.string :genre
      t.references :artist, index: true

      t.timestamps
    end
  end
end
