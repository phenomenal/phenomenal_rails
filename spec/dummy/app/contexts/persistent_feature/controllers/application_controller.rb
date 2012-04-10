class ApplicationController
  def home
    @test_title = "Overrideddffd controller"
    render "pages/home"
  end
end
