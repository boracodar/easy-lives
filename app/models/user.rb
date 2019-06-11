# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable

  validates :name, presence: true

  has_many :votes
  has_many :voted_lives, through: :votes, source: :live
end
