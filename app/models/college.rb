class College < ActiveRecord::Base
  belongs_to :student
end


  def change
    add_column :colleges, :student_id, :integer
  end
end
