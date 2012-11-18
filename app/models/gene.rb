#encoding: utf-8
class Gene < ActiveRecord::Base
  attr_accessible :cow_id, :f_gene, :m_gene, :name

	belongs_to :cow

	validates :f_gene, :presence => {:message => "유전자번호를 입력해야합니다."}
	validates :m_gene, :presence => {:message => "유전자번호를 입력해야합니다."}
	validates :name, :presence => {:message => "유전자 이름을 입력해야합니다."}
end
