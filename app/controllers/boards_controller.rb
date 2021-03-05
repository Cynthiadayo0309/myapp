class BoardsController < ApplicationController

  def index
  end

  def show
  end

  def calendar
    gon.google_calendar_API_key = ENV['GOOGLE_CALENDAR_API_KEY']
    gon.calendar_id_1 = ENV['CALENDAR_ID_1']
    gon.calendar_id_2 = ENV['CALENDAR_ID_2']
  end

end
