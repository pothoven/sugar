class BloodTestsController < ApplicationController
  # GET /blood_tests
  # GET /blood_tests.xml
  def index
    @blood_tests = BloodTest.all

    overall_tests = BloodTest.all
    @overall_count = overall_tests.length
    @overall_average = (overall_tests.collect(&:result).sum.to_f/@overall_count).round if @overall_count > 0

    breakfast_tests = BloodTest.breakfast
    @breakfast_count = breakfast_tests.length
    @breakfast_average = (breakfast_tests.collect(&:result).sum.to_f/@breakfast_count).round if @breakfast_count > 0

    lunch_tests = BloodTest.lunch
    @lunch_count = lunch_tests.length
    @lunch_average = (lunch_tests.collect(&:result).sum.to_f/@lunch_count).round if @lunch_count > 0

    dinner_tests = BloodTest.dinner
    @dinner_count = dinner_tests.length
    @dinner_average = (dinner_tests.collect(&:result).sum.to_f/@dinner_count).round if @dinner_count > 0

    bedtime_tests = BloodTest.bedtime
    @bedtime_count = bedtime_tests.length
    @bedtime_average = (bedtime_tests.collect(&:result).sum.to_f/@bedtime_count).round if @bedtime_count > 0

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blood_tests }
    end
  end

  # GET /blood_tests/new
  # GET /blood_tests/new.xml
  def new
    @blood_test = BloodTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blood_test }
    end
  end

  # GET /blood_tests/1/edit
  def edit
    @blood_test = BloodTest.find(params[:id])
  end

  # POST /blood_tests
  # POST /blood_tests.xml
  def create
    @blood_test = BloodTest.new(params[:blood_test])

    respond_to do |format|
      if @blood_test.save
        format.html { redirect_to(blood_tests_url, :notice => 'Blood test was successfully created.') }
        format.xml  { render :xml => @blood_test, :status => :created, :location => @blood_test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blood_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blood_tests/1
  # PUT /blood_tests/1.xml
  def update
    @blood_test = BloodTest.find(params[:id])

    respond_to do |format|
      if @blood_test.update_attributes(params[:blood_test])
        format.html { redirect_to(blood_tests_url, :notice => 'Blood test was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blood_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blood_tests/1
  # DELETE /blood_tests/1.xml
  def destroy
    @blood_test = BloodTest.find(params[:id])
    @blood_test.destroy

    respond_to do |format|
      format.html { redirect_to(blood_tests_url) }
      format.xml  { head :ok }
    end
  end

  def show
  end

end
