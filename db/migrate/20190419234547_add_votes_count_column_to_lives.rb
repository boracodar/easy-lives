# frozen_string_literal: true

class AddVotesCountColumnToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :votes_count, :integer, default: 0, null: false
  end
end
