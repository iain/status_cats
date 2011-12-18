class TestApp

  def call(env)
    status  = env["PATH_INFO"].gsub(/\D/, '').to_i
    status = 404 if status < 100
    headers = {"Content-Type" => "text/html"}
    body    = ["Hello, World!"]
    [ status, headers, body ]
  end

end
