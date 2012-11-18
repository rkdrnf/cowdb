class CreateKine < ActiveRecord::Migration
  def change
    create_table :kine do |t|
			t.string :name, :null => false
			t.string :code, :null => false
			t.integer :mother_id
			t.integer :father_id
			t.date :birth

      t.timestamps
    end
  end
end
