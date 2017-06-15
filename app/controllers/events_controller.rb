class EventsController < ApplicationController
    def create
        @syllabus = Syllabus.find(params[:syllabus_id])
        @event = @syllabus.events.create(params[:event].permit(:name, :date, :description))
        
        redirect_to syllabus_path(@syllabus)
    end
end
