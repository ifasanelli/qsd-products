class PeriodicitiesController < ApplicationController

  def index
    @periodicities = Periodicity.all
    if @periodicities.empty?
      flash[:alert] = 'Não há periodicidades cadastradas'
    end
  end

  def create
    @periodicity = Periodicity.new
    if @periodicity.save
      render :index
    else
      flash[:alert] = 'tente novamente'
    end
  end
end