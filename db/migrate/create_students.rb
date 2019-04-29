class CreateStudents < ActiveRecord::Base
  def change
    create_table :students  do |t|
      t.string :name
      t.string :email
      t.password :password_digest
      # t.integer :gpa
      # t.string :academic_interest
      # t.string :athletic_interest
      # t.string :hobbies
      # t.string :awards

      t.timestamps null: false
    end
  end
end
