class ExportPdf < Prawn::Document
    # include Prawn::View
  
    def initialize
      super(page_size: 'A4')
      content
    end
  
    def content
      text "Hello World!"
    end
end