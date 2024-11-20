# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: { in: 10..100 }

  def self.ransackable_attributes(auth_object = nil)
    %w[body created_at id post_id updated_at user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[post user]
  end
end
