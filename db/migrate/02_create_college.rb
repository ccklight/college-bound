class CreateCollege < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      # t.string :selectivity
      t.string :region
      # t.integer :tuition
      # t.string :grant
      # t.string :major
      # t.string :athletics
      # t.string :extracurriculars


      t.timestamps null: false
    end
  end



#IMPORTANT: Remember to add student id
 def change
  add_column :colleges, :student_id, :integer
  end
end
