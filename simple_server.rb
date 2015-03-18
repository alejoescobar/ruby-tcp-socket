require 'socket'               # Get sockets from stdlib

counter = 0 
server = TCPServer.open(2000)
client = server.accept   # Socket to listen on port 2000
loop {                         # Servers run forever      # Wait for a client to connect
  # Send the time to the client
  message = client.recv(1024)
  puts message
  if message == "PING"
    counter += 1
    puts client.write "PONG\n"
    puts counter
  elsif message[0...3] == "MSG"
    puts ''
    puts message[3..-1]
    puts client.write "OK\n"
  elsif message == "BYE"
    client.puts "Closing the connection. Bye!"
    client.close              # Disconnect from the client
  else 
    puts client.write "BADREQUEST"
  end
                
}