# frozen_string_literal: true

class Live < ApplicationRecord
  validates :subject, presence: true

  belongs_to :author, class_name: 'User'

  has_many :votes, dependent: :destroy

  scope :suggested, -> { where(episode: nil) }
  scope :recorded, -> { where.not(episode: nil) }

  def can_be_deleted?
    votes_count.zero?
  end
end
