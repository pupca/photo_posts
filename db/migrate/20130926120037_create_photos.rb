class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.string :lat
      t.string :long
      t.datetime :date
      t.string :compass

      t.timestamps
    end
  end
end
