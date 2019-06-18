class CreateCollege < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :region
      t.integer :student_id
      t.timestamps null: false
    end
  end


end
