class ChartsController < ApplicationController

  # GET /charts
  def index
    @test_types = TestType.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    test_types = params[:chart][:test_type]
    @duration  = params[:chart][:duration].to_i if params[:chart][:duration].present?
    @chart_data = Chart.collect_data_for_test_types(test_types, @duration)

    respond_to do |format|
      format.html # show.html.erb
    end
  end


end
