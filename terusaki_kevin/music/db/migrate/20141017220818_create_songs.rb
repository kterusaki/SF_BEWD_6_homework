class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :track
      t.float :time
      t.string :genre
      t.references :artist, index: true

      t.timestamps
    end
  end
end
