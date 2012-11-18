class AddGenderToKine < ActiveRecord::Migration
  def change
		add_column :kine, :gender, :integer, :null => false, :default => 1, :limit => 1
  end
end
