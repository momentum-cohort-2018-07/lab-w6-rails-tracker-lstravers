class DropTable < ActiveRecord::Migration[5.2]
  def change
  end

  def up
    drop_table :behaviors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  

end

