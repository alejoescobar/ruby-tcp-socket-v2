require 'socket'

server = TCPServer.open(2000)
puts "Listening on port 2000"

def handle_session(client)
  loop do
    message = client.gets.chomp
    if message == "PING"
      client.puts "PONG"
    elsif message == "MSG"
      client.puts "Please enter your message:"
      msg = client.gets.chomp
      p "The client sent a message:"
      p msg
    elsif message == "BYE"
      client.puts "Closing the connection..."
      break
    else
      client.puts "BADREQUEST"
    end
  end
end

loop do 
  client = server.accept
  puts "New client connection accepted"

  handle_session(client)

  client.close
end