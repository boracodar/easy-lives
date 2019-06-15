# frozen_string_literal: true

class LiveDecorator < Draper::Decorator
  delegate_all

  def formatted_episode
    "##{format('%03d', episode)}"
  end
end
