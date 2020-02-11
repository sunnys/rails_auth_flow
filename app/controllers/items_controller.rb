class ItemsController < ApplicationController
    skip_before_filter :authenticate_user!, :only => :qr_pdf

    def qr_pdf
        # render json: {}
        # return
        # respond_to do |format|
    
        #   format.pdf do
            pdf = ExportPdf.new
            send_data pdf.render,
              filename: "export.pdf",
              type: 'application/pdf',
              disposition: 'inline'
        #   end
        # end
    end
end
