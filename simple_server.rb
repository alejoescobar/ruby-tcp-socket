require 'socket'               # Get sockets from stdlib

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)  # Send the time to the client
  puts "received:" + client.recv(1024)
  client.write 'got something--closing now--here is your response message from the server'
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}