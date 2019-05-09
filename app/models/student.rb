class Student < ActiveRecord::Base
  has_secure_password
  has_many :colleges


  def slug
    username.downcase.gsub("","-")
  end


  def self.find_by_slug(slug)
    Student.all.find{|student| student.slug == slug}
  end

end
