# frozen_string_literal: true

class LiveDecorator < Draper::Decorator
  delegate_all

  def formatted_episode
    "##{format('%<episode>03d', episode: episode)}"
  end
end
