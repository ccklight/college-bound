class CreateColleges < ActiveRecord::Base
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :selectivity
      t.string :region
      t.integer :tuition
      t.string :grant
      t.string :major
      t.string :athletics
      t. string :extracurriculars
    end
  end
end
