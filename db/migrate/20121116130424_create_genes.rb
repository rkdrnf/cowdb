class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :name, :null => false
      t.integer :f_gene
      t.integer :m_gene
      t.integer :cow_id

      t.timestamps
    end
  end
end
