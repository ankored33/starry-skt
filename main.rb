require 'sinatra'
require 'sinatra/reloader' if development?

class StarrySky
  def initialize(skyname)
    @name = skyname
  end
  
  def dispName
    p @name
  end

  def quantity
    return 55
  end
end

class Partner
  def initialize(name)
    @name = name
  end
end

get "/" do
  test = StarrySky.new("test")
  @q = test.quantity
  erb :index

end


#起動オプションbundle exec ruby main.rb -p $PORT -o $IP