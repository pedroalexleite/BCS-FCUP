import random, string
from os import urandom
from binascii import hexlify
from cryptography .hazmat. primitives .ciphers import Cipher , algorithms , modes
from cryptography.hazmat.primitives import padding,hashes
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives.asymmetric import padding as rsa_padding
import sys
import time
import matplotlib.pyplot as plt
import statistics

aes_encrypt_vals = []
aes_decrypt_vals = []

rsa_encrypt_vals = []
rsa_decrypt_vals = []

time_per_file_encrypt = []
time_per_file_decrypt = []

stdev_encrypt = []
stdev_decrypt = []

def create_aes_files():
    base_eight = 8
    for x in range (7):
        f = open('aes_file'+str(x),"wb")
        f.write(bytes(create_random_string(base_eight), 'utf-8'))
        f.close()
        base_eight = base_eight*8

def create_sha_files():
    base_eight = 8
    for x in range (7):
        f = open('sha_file'+str(x),"wb")
        f.write(bytes(create_random_string(base_eight), 'utf-8'))
        f.close()
        base_eight = base_eight*8

def create_rsa_files():
    base_two = 2
    for x in range (7):
        f = open('rsa_file'+str(x),"wb")
        f.write(bytes(create_random_string(base_two), 'utf-8'))
        f.close()
        base_two = base_two*2

def create_random_string(n_chars):
    ran = ''.join(random.choices(string.ascii_letters + string.digits, k=n_chars))
    print(ran + "\n")
    return ran

def create_aes_files_b2():
    base_two = 2
    for x in range (7):
        f = open('aes_file'+str(x),"wb")
        f.write(bytes(create_random_string(base_two), 'utf-8'))
        f.close()
        base_two = base_two*2

def loop_files():
    sha_time_vals = [0] * 7

    for x in range (7):
        aes(x)
        #rsa_encrypt_decrypt(x)
        sha_time_vals[x] = sha_hash(x)
    #generate_sha_graphs(sha_time_vals)
    #generate_aes_graphs()
    #generate_rsa_graphs()
    aes_sha_graph(sha_time_vals)
    #generate_aes_rsa_graphs()

def generate_sha_graphs(x):
    sha_file_sizes = [0] * 7
    base_eight=8

    for y in range(7):
        sha_file_sizes[y] = base_eight
        base_eight = base_eight * 8

    print("Std Hashing: " + str(stdev_encrypt))

    print("SHA Hashing Average Time Array: " + str(x) + "\n")

    plt.plot(sha_file_sizes, x)
    plt.xlabel('File Size')
    plt.ylabel('Time to generate hash')
    plt.title('SHA-256')
    plt.ylim(0,0.01)
    plt.xlim(0,sha_file_sizes[6])
    plt.show()

def generate_aes_graphs():
    aes_file_sizes = [0] * 7
    base_eight=8

    for y in range(7):
        aes_file_sizes[y] = base_eight
        base_eight = base_eight * 8

    print("Std encrypt: " + str(stdev_encrypt))
    print("Média encrypt: " + str(aes_encrypt_vals))
    print("\n")
    print("Std decrypt: " + str(stdev_decrypt))
    print("Média decrypt: " + str(aes_decrypt_vals))

    plt.plot(aes_file_sizes,aes_encrypt_vals, label='Encryption time')
    plt.plot(aes_file_sizes,aes_decrypt_vals, label='Decryption time')
    plt.xlabel('File Size')
    plt.ylabel('Time to encrypt')
    plt.title('AES')
    plt.ylim(0,0.0005)
    plt.xlim(0,aes_file_sizes[6])
    plt.legend()
    plt.show()

def aes_sha_graph(x):
    file_sizes = [0] * 7
    base_eight=8

    for y in range(7):
        file_sizes[y] = base_eight
        base_eight = base_eight * 8

    print("AES avg encryption time: " + str(aes_encrypt_vals) + "\n")
    print("SHA avg encryption time: " + str(x) + "\n")
    plt.plot(file_sizes,aes_encrypt_vals, label='AES')
    plt.plot(file_sizes, x, label = 'SHA-256')
    plt.xlabel('File Size')
    plt.ylabel('Time to encrypt/digest')
    plt.title('AES/SHA')
    plt.ylim(0,0.002)
    plt.xlim(0,file_sizes[6])
    plt.legend()
    plt.show()

def generate_rsa_graphs():
    rsa_file_sizes = [0] * 7
    base_two=2

    for y in range(7):
        rsa_file_sizes[y] = base_two
        base_two = base_two * 2

    print("Std encrypt: " + str(stdev_encrypt))
    print("RSA Encryption Time Array: " + str(rsa_encrypt_vals) + "\n")
    print("\n")
    print("Std decrypt: " + str(stdev_decrypt))
    print("RSA Decryption Time Array: " + str(rsa_decrypt_vals) + "\n")

    plt.plot(rsa_file_sizes, rsa_encrypt_vals, label='Encryption time')
    plt.plot(rsa_file_sizes, rsa_decrypt_vals, label='Decryption time')
    plt.xlabel('File Size')
    plt.ylabel('Time to encrypt/decrypt')
    plt.title('RSA')
    plt.ylim(0,0.00085)
    plt.xlim(0,rsa_file_sizes[6])
    plt.legend()
    plt.show()

def generate_aes_rsa_graphs():
    file_sizes = [0] * 7
    base_two=2

    for y in range(7):
        file_sizes[y] = base_two
        base_two = base_two * 2

    print("avg RSA encryption time: " + str(rsa_encrypt_vals) + "\n")
    print("avg AES encryption time: " + str(aes_encrypt_vals) + "\n")

    plt.plot(file_sizes, rsa_encrypt_vals, label='RSA')
    plt.plot(file_sizes,aes_encrypt_vals, label='AES')
    plt.xlabel('File Size')
    plt.ylabel('Time to encrypt')
    plt.title('AES/RSA')
    plt.ylim(0,0.00008)
    plt.xlim(0,file_sizes[6])
    plt.legend()
    plt.show()

def aes(x):
    padder = padding.PKCS7(128).padder()
    unpadder = padding.PKCS7(128).unpadder()
    key = urandom (32)
    iv = urandom (16)
    cipher = Cipher( algorithms .AES(key), modes.CBC (iv))
    encryptor = cipher. encryptor ()
    decryptor = cipher.decryptor()
    current_file = 'aes_file'+str(x)
    encrypt_sum=0
    decrypt_sum=0
    start_decrypt=0
    final_time=0
    start_encrypt=0
    final_time_encrypt=0

    with open(current_file, 'r') as file:
        plaintext = file.read()
        bytes_plaintext = bytes(plaintext, 'utf-8')

        #encrypt
        for y in range(1000):
            padder = padding.PKCS7(128).padder()
            encryptor = cipher. encryptor ()
            padded_data = padder.update(bytes_plaintext)
            padded_data += padder.finalize()
            start_encrypt = time.process_time()
            ct = encryptor.update(padded_data) + encryptor .finalize ()
            final_time_encrypt = time.process_time() - start_encrypt
            encrypt_sum = encrypt_sum + final_time_encrypt
            time_per_file_encrypt.append(final_time_encrypt)
        avg_encrypt_time = encrypt_sum/1000
        calculate_stdeviation(time_per_file_encrypt,0)
        time_per_file_encrypt.clear()

        #decrypt
        for y in range(1000):
            decryptor = cipher.decryptor()
            unpadder = padding.PKCS7(128).unpadder()
            start_decrypt = time.process_time()
            pt = decryptor.update(ct) + decryptor.finalize()
            data = unpadder.update(pt)
            pt_wopadding = data + unpadder.finalize()
            final_time = time.process_time() - start_decrypt
            decrypt_sum = decrypt_sum + final_time
            time_per_file_decrypt.append(final_time)
        avg_decrypt_time = decrypt_sum/10000
        calculate_stdeviation(time_per_file_decrypt,1)
        time_per_file_decrypt.clear()
    aes_encrypt_vals.append(avg_encrypt_time)
    aes_decrypt_vals.append(avg_decrypt_time)

def rsa_encrypt_decrypt(x):
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
    )
    public_key = private_key.public_key()

    encrypt_sum=0
    decrypt_sum=0
    current_file = 'rsa_file'+str(x)

    for y in range(1000):
        with open(current_file, 'r') as file:
            plaintext = file.read()
            bytes_plaintext = bytes(plaintext, 'utf-8')
            start_encrypt = time.process_time()
            ciphertext = public_key.encrypt(
                bytes_plaintext,
                rsa_padding.OAEP(
                    mgf=rsa_padding.MGF1(algorithm=hashes.SHA256()),
                    algorithm=hashes.SHA256(),
                    label=None
                )
            )
            final_encrypt = (time.process_time() - start_encrypt)
        encrypt_sum = encrypt_sum + final_encrypt
        time_per_file_encrypt.append(final_encrypt)
    calculate_stdeviation(time_per_file_encrypt,0)
    time_per_file_encrypt.clear()
    avg_encrypt_time = encrypt_sum/1000

    for y in range(1000):
        start_decrypt = time.process_time()
        pt = private_key.decrypt(
            ciphertext,
            rsa_padding.OAEP(
                mgf=rsa_padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
            )
        )
        final_decrypt = time.process_time() - start_decrypt
        decrypt_sum = decrypt_sum + final_decrypt
        time_per_file_decrypt.append(final_decrypt)
    calculate_stdeviation(time_per_file_decrypt,1)
    time_per_file_decrypt.clear()
    avg_decrypt_time = decrypt_sum/1000


    rsa_encrypt_vals.append(avg_encrypt_time)
    rsa_decrypt_vals.append(avg_decrypt_time)


def sha_hash(x):
    current_file = 'sha_file'+str(x)
    time_sum=0

    for y in range(1000):
        with open(current_file, 'r') as file:
            plaintext = file.read()
            bytes_plaintext = bytes(plaintext, 'utf-8')
            start = time.process_time()
            digest = hashes.Hash(hashes.SHA256())
            digest.update(bytes_plaintext)
            hashed_message = digest.finalize()
            final_hash = (time.process_time() - start)
            time_sum = time_sum + final_hash
            time_per_file_encrypt.append(final_hash)
    calculate_stdeviation(time_per_file_encrypt,0)
    time_per_file_encrypt.clear()
    return time_sum/1000

def calculate_stdeviation(x,y):
    if (y==0) :
        stdev_encrypt.append(statistics.stdev(x))
    else:
        stdev_decrypt.append(statistics.stdev(x))

#create_aes_files()
#create_rsa_files()
#create_sha_files()
#create_aes_files_b2()
loop_files()
