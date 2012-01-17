class BusquedaContenidoController < ApplicationController
 
 def buscar_contenido  	
	@pdfs = Pdf.search params[:search]        
        respond_to do |format|
        	format.html # index.html.erb
        	format.json { render json: @pdfs }
        end
 end

end
