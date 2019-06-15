# frozen_string_literal: true

class LiveDecorator < Draper::Decorator
  delegate_all

  def formatted_episode
    "##{'%03d' % episode}"
  end
end
