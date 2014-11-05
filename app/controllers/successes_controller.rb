class SuccessesController < ApplicationController
  def index
    @successes = Success.all
  end

  def new
    @success = Success.new
  end

  def create
    @success = Success.new(success_params)

    if @success.save
      flash[:notice] = "Thanks"
      redirect_to @success
    else
      render :new
    end
  end

  def edit
    @success = Success.find(params[:id])
  end

  def update
    @success = Success.find(params[:id])

    if @success.update(success_params)
      flash[:notice] = "Updated"
      redirect_to success_path(@success)
    else
      render :edit
    end
  end

  def show
    @success = Success.find(params[:id])
  end

  def destroy
    @success = Success.find(params[:id])
    @success.destroy
    redirect_to :action => 'index'
  end

  private
    def success_params
      params.require(:success).permit(:user, :text)
    end

end
