class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }

  # after_create :send_user_mail

  # def send_user_mail
  # 	UserMailer.send_new_user_message(self).deliver
  # end

  enum role: [:member, :admin, :premium]
end
