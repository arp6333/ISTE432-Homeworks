# Ellie Parobek - ISTE432 - Exercise 4
# Info gathered from https://passlib.readthedocs.io/en/stable/lib/passlib.hash.argon2.html
# Install argon2 using 'sudo python -m pip install argon2_cffi' in the command line, then run using 'python exercise4.py'
# Salt is auto generated with no params set when hash is called
from argon2 import PasswordHasher
# Get Argon2 password hasher
ph = PasswordHasher()
# Get user inputed password
password = raw_input("Enter a password: ")
# Hash the password
hashed = ph.hash(password)
# Get just the password part out of the string
hashedPW = hashed.split(',')[2].split('=')[1][2:]
# Display new password
print("Full hash string: " + hashed)
print("Hashed password: " + hashedPW)