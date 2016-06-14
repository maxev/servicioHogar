class AddClientIdToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :client, index: true, foreign_key: true
  end
end
