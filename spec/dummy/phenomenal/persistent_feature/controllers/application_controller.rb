class ApplicationController
  def home
    @test_title = "Overrided controller"
    render "pages/home"
  end
end
