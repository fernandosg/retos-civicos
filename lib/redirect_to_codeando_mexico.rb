class RedirectToCodeandoMexico
  APP_NAME = "codeando-mexico"

  def initialize(app)
    @app = app 
  end

  def call(env)
    if env['HTTP_HOST'].include?(APP_NAME)
      request_url = Rack::Request.new(env).url
      redirect_to_url = request_url.gsub(/codeando-mexico.herokuapp.com|codeando-mexico.heroku.com/, "codeandomexico.org")
      [301, { 'Location' => redirect_to_url }, ['Redirecting...']]
    else
      @app.call(env)
    end
  end
end
