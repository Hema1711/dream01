class MemeberPdf < Prawn::Document
    def initialize(orders)
        super()
        @order = Order.all
        text
    end
end