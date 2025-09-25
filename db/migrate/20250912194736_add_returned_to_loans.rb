class AddReturnedToLoans < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :returned, :boolean, default: false
  end
end
