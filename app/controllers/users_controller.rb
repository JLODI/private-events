class UsersController < ApplicationController

    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @created_events = @user.created_events
        @attended_events = @user.attended_events
        @past_events = @attended_events.where("date < ?", Date.today)
        @future_events = @attended_events.where("date >= ?", Date.today).order(date: :asc)
    end
end