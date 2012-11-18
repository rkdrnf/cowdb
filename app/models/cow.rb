#encoding: utf-8
class Cow < ActiveRecord::Base
  attr_accessible :name, :code, :father_id, :mother_id, :birth, :gender

	has_many :genes, :dependent => :destroy

	belongs_to :father, :class_name => "Cow",
		:foreign_key => "father_id"

	belongs_to :mother, :class_name => "Cow",
		:foreign_key => "mother_id"

	has_many :children_of_father, :class_name => "Cow", :foreign_key => "father_id"
	has_many :children_of_mother, :class_name => "Cow", :foreign_key => "mother_id"

	validates :name, :presence => {:message => "이름을 입력해야합니다."}
	validates :code, :presence => {:message => "개체번호를 입력해야합니다."}, :uniqueness => {:message => "중복된 개체번호입니다."}

	def children
		return self.children_of_father + self.children_of_mother
	end

	def birth_str
		return birth.nil? ? "" : self.birth.to_time.strftime("%b, %d, %Y")
	end

	def gender_str
		if gender == 0 then
			return "male"
		else
			return "female"
		end
	end
end
