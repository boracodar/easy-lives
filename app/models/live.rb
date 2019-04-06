class Live < ApplicationRecord
  validates :subject, presence: true

  belongs_to :author
end
