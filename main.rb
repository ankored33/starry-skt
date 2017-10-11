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
    return 20
  end
end

test = StarrySky.new("test")
test.dispName
p test.quantity

get "/" do
  erb :index

end


#起動オプションbundle exec ruby main.rb -p $PORT -o $IP