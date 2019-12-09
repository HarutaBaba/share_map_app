class Users < ActiveRecord::Migration[5.1]
  mount_uploader :image, ImageUploader
  def change
  end
end
