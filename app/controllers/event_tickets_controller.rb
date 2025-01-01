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

    def destroy
        @event_ticket = EventTicket.where(attended_event_id: params[:event_id], attendee_id: current_user.id)
        @event_ticket = @event_ticket.first
        @event_ticket.destroy
            if @event_ticket.first.destroy
                flash[:notice] = "You are no longer attending the event."
                redirect_to event_path(params[:attended_event_id])
            else
                flash.now[:error] = @event_ticket.errors.full_messages.join ('<br/>')
                render :destroy, status: :unprocessable_entity
            end
    end  

    private
    def event_ticket_params
        params.expect(event_ticket:[:attendee_id, :attended_event_id])
    end
end
