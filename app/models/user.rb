class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :connections
  has_many :returns
  has_many :borrows
  has_many :requests
  has_many :stones
  has_many :stones, through: :requests # not sure if this line is necessary

  # mount_uploader :photo, PhotoUploader
  # uncomment above when Cloudinary is set up

  # returns a list of contacts belonging to a user
  def contacts
    self.connections.map do |connection|
      connection.contact
    end
  end
end
