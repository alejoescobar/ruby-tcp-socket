require 'socket'               # Get sockets from stdlib

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)  # Send the time to the client
  message = client.recv(1024)
  if message == "PING"
    puts client.write "PONG\n"
  elsif message == "MSG"
    puts "hallo"
    puts client.write "OK\n"
  end
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}