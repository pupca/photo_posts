class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  after_create :get_exif
  validates_presence_of :photo

  def get_exif
    exif = EXIFR::JPEG.new(self.photo.file.file)
    update_attribute(:lat, exif.gps && exif.gps.latitude ? exif.gps.latitude : "")
    update_attribute(:long, exif.gps && exif.gps.longitude ? exif.gps.longitude : "")
    update_attribute(:date, exif.date_time)
    update_attribute(:compass, exif.gps && exif.gps.image_direction ? exif.gps.image_direction : "")
  end
end
