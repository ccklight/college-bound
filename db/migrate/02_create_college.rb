class CreateCollege < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :region

      t.timestamps null: false
    end
  end



#IMPORTANT: Remember to add student id
 def change
  add_column :colleges, :student_id
  end

end
