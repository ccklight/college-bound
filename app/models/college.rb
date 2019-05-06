class College < ActiveRecord::Base
  belongs_to :student


  def change
    add_column :colleges, :student_id, :integer
  end

  # Make into a module def slug and def self.find_by_slug
  def slug
    username.downcase.gsub(" ","-")
  end


  def self.find_by_slug(slug)
    College.all.find{|college| college.slug == slug}
  end

end
