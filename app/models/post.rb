# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :article, presence: true
  validates :article, length: { in: 10..200 }

  enum status: { visible: 0, archived: 1 }

  def self.ransackable_attributes(auth_object = nil)
    %w[article created_at id id_value status title updated_at user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[comments user]
  end
end
