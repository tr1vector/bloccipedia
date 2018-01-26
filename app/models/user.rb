class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  # after_create :send_user_mail

  # def send_user_mail
  # 	UserMailer.send_new_user_message(self).deliver
  # end
end
