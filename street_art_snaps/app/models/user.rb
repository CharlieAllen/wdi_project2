class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos, dependent: :destroy
  belongs_to :location
  mount_uploader :user_image, UserImageUploader

  def full_name
    [first_name, last_name].join(" ")
  end
end
