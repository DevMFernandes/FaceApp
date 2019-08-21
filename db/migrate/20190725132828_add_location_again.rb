class AddLocationAgain < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :location, index: true
  end
end
