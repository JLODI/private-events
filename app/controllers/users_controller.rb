class UsersController < ApplicationController

    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @created_events = @user.created_events
        @attended_events = @user.attended_events
    end
end