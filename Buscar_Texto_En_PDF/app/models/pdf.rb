require 'docsplit'
require 'rake'

class Pdf < ActiveRecord::Base
 mount_uploader :nombreArchivo, PdfUploader
 before_save :crear_archivo_texto
 before_create :guardar_contenido_texto_en_tabla
 after_commit :realizar_el_rake

 def crear_archivo_texto
  Docsplit.extract_text(File.expand_path("~/Proyectos_SGM/Buscar_Texto_En_PDF/public")+nombreArchivo.to_s, :output=> 'public/archivos/txt')
 end   

 def guardar_contenido_texto_en_tabla
  cadena = ""
  self.contenido = ""
  File.open(File.expand_path("~/Proyectos_SGM/Buscar_Texto_En_PDF/public/archivos/txt/")+"/"+nombreArchivo.file.filename.to_s.gsub(".pdf", ".txt"), 'r') do |f1|
  	while lineaArchivo = f1.gets
	 cadena = cadena + lineaArchivo
   	end
  end
  self.contenido = cadena
 end

 def realizar_el_rake
  debugger
  system("rake ts:index")
 end

 define_index do
  indexes self.contenido
 end

end
