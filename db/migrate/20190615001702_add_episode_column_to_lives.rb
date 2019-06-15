# frozen_string_literal: true

class AddEpisodeColumnToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :episode, :integer
  end
end
