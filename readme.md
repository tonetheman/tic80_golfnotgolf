
# tic80 golf not golf

What was supposed to be a golf example turned into an asteroids thing...
not even a good one really.


## used this to generate a root cert

password I picked is password

openssl genrsa -des3 -out rootCA.key 2048

Then this to make a cert for use
You need to type in root password (password) to run this command

openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem

## I gave up on caddy and crostini
I could not get it working. I checked in all the keys. They are all throw away and local only so it does not matter if they are public or not.
