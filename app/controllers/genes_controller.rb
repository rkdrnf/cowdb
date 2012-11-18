class GenesController < ApplicationController
	def add_gene
		render "add_gene"
	end

	def remove_gene
		@g_id = params[:id]
	end
end
