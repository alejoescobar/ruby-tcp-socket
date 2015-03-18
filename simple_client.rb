# El protocolo está compuesto de los siguientes mensajes:
# * Cuando el cliente envía PING, el servidor debe responder PONG.

require 'socket'      # Sockets are in standard library

hostname = '192.168.10.75'
port = 2000
input = String.new
s = TCPSocket.open(hostname, port)

while input != "BYE"

  input = gets.chomp
  s.write(input)

  puts "recieved:" + s.recv(1024)

end

s.close               # Close the socket when done
