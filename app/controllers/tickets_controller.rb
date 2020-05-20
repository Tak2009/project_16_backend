class TicketsController < ApplicationController

    def index
        tickets = Ticket.all
        render json: tickets
        # render plain: "hello world"
    end

end
