class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    def show
        @event = Event.find(params[:id])
    end
    def new
        @event = Event.new
    end
    def create
        @event = current_user.created_events.build(event_params)
        if @event.save
            flash[:notice] = "Your Event has been posted!"
            redirect_to events_index
        else
            flash.now[:error] = @event.errors.full_messages.join ('<br/>')
            render :new, status: :unprocessable_entity
        end
    end

private
    def event_params
        params.expect(event: [:name, :date, :desc])
    end
end
