class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :validatable

	has_many :statuses, dependent: :destroy

	enum sex: [:man, :woman]

	validates :name, presence: true
	validates :email, presence: true
	validates :message, length: {maximum: 300}
end
