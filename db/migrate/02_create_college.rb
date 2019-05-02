class CreateCollege < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :selectivity
      t.string :region
      t.integer :tuition
      t.string :grant
      t.string :major
      t.string :athletics
      t.string :extracurriculars
#add student id 
      t.timestamps null: false
    end
  end
end
