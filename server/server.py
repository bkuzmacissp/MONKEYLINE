import socket
import threading
import smtplib 
from email.mime.text import MIMEText

BIND_IP = '0.0.0.0'
BIND_PORT = 31337

def handle_client(client_socket):
    client_socket.send('''echo 'Find Bobby or Jack at the Core Security Booth. The codeword is MONKEYLINE.' >> ~/a_gift_from_core\n''')
    #client_socket.send('info\n')
    print "[*] Sent Payload"
    request = client_socket.recv(1024)
    print "[*] Received: " + request
    client_socket.close()
    
    

def tcp_server():
    server = socket.socket( socket.AF_INET, socket.SOCK_STREAM)
    server.bind(( BIND_IP, BIND_PORT))
    server.listen(5)
    print"[*] Listening on %s:%d" % (BIND_IP, BIND_PORT)

    while 1:
        client, addr = server.accept()
        print "[*] Accepted connection from: %s:%d" %(addr[0], addr[1])
        client_handler = threading.Thread(target=handle_client, args=(client,))
        #msg = MIMEText("Connection from %s" % (addr[0]))
        #msg["subject"] = "MONKEYLINE connection from %s" % (addr[0])
        #msg["From"] = "monkeyline@coresecurity.com"
        #msg["To"] = "bkuzma@coresecurity.com"
        #s = smtplib.SMTP("buemx1.coresecurity.com")
        #s.sendmail("monkeyline@coresecurity.com","bkuzma@coresecurity.com",msd.as_string())
        #s.quit()
        client_handler.start()

if __name__ == '__main__':
    tcp_server()
    
