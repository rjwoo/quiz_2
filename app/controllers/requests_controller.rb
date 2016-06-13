class RequestsController < ApplicationController


  def index
    @requests = Request.all
    @requests = Request.paginate(:page => params[:page], :per_page => 7)
  end

  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit(:name, :email, :department, :message)
    @request = Request.new request_params
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def show
    @request = Request.find params[:id]
  end

  def edit
    @request = Request.find params[:id]
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
    request_params = params.require(:request).permit(:name, :email, :department)
    @request = Request.new request_params
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end

  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

  def done
    @request = Request.find(params[:request_id])
    @request.done = 'true'
    save
    redirect_to request_path
  end

end
