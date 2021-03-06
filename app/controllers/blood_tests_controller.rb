class BloodTestsController < ApplicationController
  # GET /blood_tests
  def index
    @blood_tests = BloodTest.recent

    @overall_count     = BloodTest.recent.count
    @overall_average   = BloodTest.recent.average(:result).round.to_i
    @breakfast_count   = BloodTest.recent.breakfast.count
    @breakfast_average = BloodTest.recent.breakfast.average(:result)
    @breakfast_average = @breakfast_average.round.to_i unless @breakfast_average.nil?
    @lunch_count       = BloodTest.recent.lunch.count
    @lunch_average     = BloodTest.recent.lunch.average(:result)
    @lunch_average     = @lunch_average.round.to_i unless @lunch_average.nil?
    @dinner_count      = BloodTest.recent.dinner.count
    @dinner_average    = BloodTest.recent.dinner.average(:result)
    @dinner_average    = @dinner_average.round.to_i unless @dinner_average.nil?
    @bedtime_count     = BloodTest.recent.bedtime.count
    @bedtime_average   = BloodTest.recent.bedtime.average(:result)
    @bedtime_average   = @bedtime_average.round.to_i unless @bedtime_average.nil?

=begin
    # the following block of code will compute all the averages
    # manually using the initial 'select all' query rather than the
    # ActiveRecord calculation functions which may require multiple
    # additional queries

    overall_tests = @blood_tests
    @overall_count = overall_tests.length
    @overall_average = (overall_tests.collect(&:result).sum.to_f/@overall_count).round if @overall_count > 0

  @blood_tests.group_by(&:test_type_id).each do | test_type_id, blood_test_group |
    test_count = blood_test_group.length
      test_average = (blood_test_group.collect(&:result).sum.to_f/test_count).round if test_count > 0

    case test_type_id
    when 1
      @breakfast_count = test_count
    @breakfast_average = test_average
    when 2
      @lunch_count = test_count
    @lunch_average = test_average
    when 3
      @dinner_count = test_count
    @dinner_average = test_average
    when 4
      @bedtime_count = test_count
    @bedtime_average = test_average
      end
    end
=end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def bulk_edit
    @blood_tests = BloodTest.recent
  end

  # GET /blood_tests/new
  def new
    @blood_test = BloodTest.new
    @blood_test.test_date = Date.today

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /blood_tests/1/edit
  def edit
    @blood_test = BloodTest.find(params[:id])
  end

  # POST /blood_tests
  def create
    @blood_test = BloodTest.new(params[:blood_test])

    respond_to do |format|
      if @blood_test.save
        format.html { redirect_to(blood_tests_url, :notice => 'Blood test was successfully created.') }
        format.js   {
          @blood_test = @blood_test.reload
          @success = true
          render :action => "update"
        }
      else
        format.html { render :action => "new" }
        format.js   {
          @success = false
          render :action => "update"
        }
      end
    end
  end

  # PUT /blood_tests/1
  def update
    @blood_test = BloodTest.find(params[:id])

    respond_to do |format|
      if @blood_test.update_attributes(params[:blood_test])
        format.html { redirect_to(blood_tests_url, :notice => 'Blood test was successfully updated.') }
        format.js   { @success = true }
      else
        format.html { render :action => "edit" }
        format.js   {
          unless params[:blood_test][:result].present?
            if @blood_test.destroy
              @blood_test = BloodTest.new(@blood_test.attributes)
              @success = true
            else
              @success = false
            end
          else
            @success = false
          end
        }
      end
    end
  end

  # DELETE /blood_tests/1
  def destroy
    @blood_test = BloodTest.find(params[:id])
    @blood_test.destroy

    respond_to do |format|
      format.html { redirect_to(blood_tests_url) }
    end
  end

  def show
  end

end
