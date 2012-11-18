#encoding: utf-8
class KineController < ApplicationController

	def index
		@kine = Cow.all
	end

	def show
		@cow = Cow.find(params[:id])

		@genes = @cow.genes

		@mother = @cow.mother
		@father = @cow.father
	end

	def new
		@cow = Cow.new

		@mothers_m = Cow.select(["id", "gender", "name", "code"]).where(:gender => 1)
		@fathers_m = Cow.select(["id", "gender", "name", "code"]).where(:gender => 0)

	end

	def create
		begin 

			@genes = []

			@cow = Cow.new(params[:cow])

			@cow.birth = Time.new(params[:b_year], params[:b_month], params[:b_day]).to_date if params[:b_year].length > 0


			@father = Cow.where(:code => params[:father]).first unless params[:father] == ""
			@mother = Cow.where(:code => params[:mother]).first unless params[:mother] == ""

			if params[:father] != "" and @father.nil? then
				raise "부 개체의 개체번호가 잘못되었습니다."
			end

			if params[:mother] != "" and @mother.nil? then
				raise "모 개체의 개체번호가 잘못되었습니다."
			end

			@cow.father = @father unless params[:father] == ""
			@cow.mother = @mother unless params[:mother] == ""


			params[:gene].each do |g|
				if g["name"] != "" 
					gene = Gene.create!(g)
					@cow.genes << gene
					@genes << gene
				end
			end 

			@cow.save!

			render "create", :locals => {:success => true}

		rescue Exception => e

			@genes.each do |g|
				g.destroy
			end
			render "create", :locals => {:success => false, :error => @cow.errors.full_messages, :error2 => e.message}
		end
	end

	def destroy
		@cow = Cow.find(params[:id])

		@cow.destroy

		redirect_to kine_path
	end
end
