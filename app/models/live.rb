# frozen_string_literal: true

class Live < ApplicationRecord
  validates :subject, presence: true

  belongs_to :author, class_name: 'User'

  has_many :votes
end
