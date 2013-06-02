class TestController < Rulers::Controller
  def index
    render :index, :name => "Mark"
  end
end
