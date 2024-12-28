class EventsController < ApplicationController
    
    before_action :authenticate_user!

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        @event_ticket = EventTicket.new(attendee_id: current_user.id, attended_event_id: @event.id)
    end

    def new
        @event = Event.new
    end
    def create
        @event = current_user.created_events.build(event_params)
        if @event.save
            flash[:notice] = "Your Event has been posted!"
            redirect_to events_path
        else
            flash.now[:error] = @event.errors.full_messages.join ('<br/>')
            render :new, status: :unprocessable_entity
        end
    end

private
    def event_params
        params.expect(event: [:name, :date, :desc, :image_url, :location])
    end
end
