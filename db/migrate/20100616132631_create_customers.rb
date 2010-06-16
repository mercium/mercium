class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table(:customers) do |t|
      t.string :title,         :limit => 10
      t.string :first_name,    :limit => 40, :null => false
      t.string :last_name,     :limit => 50, :null => false

      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both

      t.timestamps
    end

    add_index :customers, :email,                :unique => true
    add_index :customers, :confirmation_token,   :unique => true
    add_index :customers, :reset_password_token, :unique => true
    add_index :customers, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :customers
  end
end
