# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify

  enum role: { regular: 0, admin: 1 }
  enum gender: { male: 0, female: 1 }
  enum status: { normal: 0, banned: 1  }

  def full_name
    "#{first_name} #{last_name}"
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :gender, :phone_number, :email, :status)
  end
end
