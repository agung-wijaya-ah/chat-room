class RoomsController < ApplicationController
  before_action :load_entities
  def index
    @rooms = Room.all
  end
  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
    begin
      @room.save!
      redirect_to ({ action: "show", id: @room.id })
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = e.record.errors.full_messages.to_sentence
      render :action => "new"
    end
  end

  def edit
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.all
    respond_to do |format|
      format.html
      format.json { 
        render json: @room_messages
      }
    end
  end
  
  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
