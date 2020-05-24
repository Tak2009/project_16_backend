class TicketsController < ApplicationController

    def index
        tickets = Ticket.all
        render json: tickets
        # render plain: "hello world"
    end

    def create
        ticket = Ticket.new(ticket_params)
    
        if ticket.save
          render json: ticket, status: :created
        else
          render json: ticket.errors, status: :unprocessable_entity
        end
      end

    private
    def ticket_params
    params.require(:ticket).permit!
    end

end
