# Quick Lab
A quick lab environment for testing Salt.

## NOTE
This is only tested to work on Linux

# Usage

Stand-up the environment with the following commands.

```
user@labmachine ~/apps/quicklab $ usage: build_image.py [-h] [-t TAG] [-m M] [-v] version

positional arguments:
  version            Specify version to install

optional arguments:
  -h, --help         show this help message and exit
  -t TAG, --tag TAG  Specify the tag to use instead of the default (default:
                     base)
  -m M               Specify the master IP/hostname to use in the image
                     (default: salt)
  -v                 Print Python version and exit (default: False)

user@labmachine ~/apps/quicklab $ # The tag and version should match what you specified in your Dockerfiles
user@labmachine ~/apps/quicklab $ python3 ./build_image.py -t salty -m salt 2018.3.2 
user@labmachine ~/apps/quicklab $ docker-compose build
user@labmachine ~/apps/quicklab $ docker-compose up -d --scale minion=5
```
