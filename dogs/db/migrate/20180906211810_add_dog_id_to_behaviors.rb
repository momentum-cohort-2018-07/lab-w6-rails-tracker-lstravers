class AddDogIdToBehaviors < ActiveRecord::Migration[5.2]
  def change
    add_column :behaviors, :dog_id, :integer
  end
end
