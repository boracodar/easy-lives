# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :live, counter_cache: true
  belongs_to :user

  validates :live, uniqueness: {
    scope: :user,
    message: 'só pode votar uma vez em cada assunto'
  }
end
