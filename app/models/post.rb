# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :article, presence: true
  validates :article, length: { in: 10..200 }

  enum status: { visible: 0, archived: 1 }
end
