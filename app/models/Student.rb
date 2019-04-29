class Student < ActiveRecord::Base
    has_many :colleges

    has_secure_password

  def slug
    username.downcase.gsub("","-")
    # name.downcase.gsub("","-")
  end

  def self.find_by_slug(slug)
    Student.all.find{|student| student.slug == slug}
  end

end
