class Admin::TestsController < Admin::BaseController
  # before_action :authenticate_user!
  before_action :find_test, only: %i[show edit update destroy]
  
  def new 
    @test = Test.new
  end

  def index
    @tests = Test.all
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to admin_tests_path(@test)
    else
      render new_admin_test_path
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test), notice: "Test '#{@test.title}' was successfully update."
    else
      render new_admin_test_path
    end
  end

  # def start
  #   current_user.tests.push(@test)
  #   redirect_to current_user.test_passage(@test)
  # end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end
  
private

  def find_test
    @test = Test.find(params[:id])    
  end

  # def find_user
  #   @user = User.first
  # end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end