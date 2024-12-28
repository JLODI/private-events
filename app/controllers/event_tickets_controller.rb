class EventTicketsController < ApplicationController
    def new
        @event_ticket = EventTicket.new
    end
    def create
        @event_ticket = EventTicket.new(event_ticket_params)
        if @event_ticket.save
            flash[:notice] = "You are going to the event!"
            redirect_to event_path(:id)
        else
            flash.now[:error] = "Something went wrong, please try again."
        end
    end

    def show
        @event_ticket = Event.find(params[:attended_event_id])
    end
    private
    def event_ticket_params
        params.expect(event_ticket:[:attendee_id, :attended_event_id])
    end
end
