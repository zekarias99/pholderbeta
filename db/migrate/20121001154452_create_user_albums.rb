class CreateUserAlbums < ActiveRecord::Migration
  def change
    create_table :user_albums do |t|

      t.timestamps
    end
  end
end
