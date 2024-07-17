from os import urandom
from binascii import hexlify
from cryptography .hazmat. primitives .ciphers import Cipher , algorithms , modes

key = urandom (16)
iv = urandom (16)
cipher = Cipher(algorithms.AES(key), modes.CBC(iv))
print(iv)
encryptor = cipher.encryptor()
# What happens if you don ' t p a s s 16−b y t e i n p u t ?
ct = encryptor.update(b"attack at dawn!!") + encryptor.finalize ()
print(hexlify(key))
cphFile = open("ciphertext.bin", "wb")
cphFile.write(ct)
cphFile.close()

#openssl enc -aes-128-cbc -nopad -d -K c393fafb8e4b70bbc3d0db9adf8b4a4b -in ciphertext.cbc
#openssl -> run openssl / help aes-128-ecb
