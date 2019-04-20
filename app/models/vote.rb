class Vote < ApplicationRecord
  belongs_to :live
  belongs_to :user

  validates :live, uniqueness: {
    scope: :user,
    message: 'só pode votar uma vez em cada assunto'
  }
end
