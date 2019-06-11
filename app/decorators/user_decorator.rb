# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def avatar_url
    hash = Digest::MD5.hexdigest(email.downcase)

    "https://www.gravatar.com/avatar/#{hash}?s=60"
  end
end
