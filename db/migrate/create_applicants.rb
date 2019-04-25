class CreateApplicants < ActiveRecord::Base
  def change
    create_table :applicants  do |t|
      t.string :name
      t.string :email
      t.password :password_digest
      t.integer :gpa
      t.string :academic_interest
      t.string :athletic_interest
      t.string :hobbies
      t.string :awards
    end
  end
end
