# El protocolo está compuesto de los siguientes mensajes:
# * Cuando el cliente envía PING, el servidor debe responder PONG.

require 'socket'      # Sockets are in standard library

hostname = '192.168.10.75'
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets   # Read lines from the socket
  puts line.chop      # And print with platform line terminator
  s.write "Hello"
  puts "got back:" + s.recv(1024)
  # message = gets.chomp
  # message = 'GETHELLO'
  # s.write(message)
  # puts s.read(5)
end
s.close               # Close the socket when done
