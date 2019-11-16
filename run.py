import socket
import time
import subprocess

ip = 'db'
port = 3306
delay = 3
timeout = 1


def is_open():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(timeout)
    try:
        s.connect((ip, int(port)))
        s.shutdown(socket.SHUT_RDWR)
        return True
    except:
        return False
    finally:
        s.close()


def check_port():
    while True:
        if is_open():
            subprocess.call(['python3', 'manage.py', 'runserver', '0.0.0.0:8000'])
        else:
            time.sleep(delay)


if __name__ == "__main__":
    check_port()
