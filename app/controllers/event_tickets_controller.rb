class EventTicketsController < ApplicationController
    def new
        @event_ticket = Event.find(params[:id])
    end
    def create
        @event_ticket = Event.find(params[:id])
        @event_ticket.attendees << current_user
        if @event_ticket.save
            flash[:notice] = "You are going to the event!"
            redirect_to users_path
        else
            flash.now[:error] = "Something went wrong, please try again."
        end
    end
end
