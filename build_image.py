#!/usr/bin/env python


import os
import sys
import io
import argparse
import subprocess
import shlex
import time
from io import BytesIO
from pprint import pprint

try:
    import docker
except ImportError as e:
    print("Trying installing docker module with pip install docker")
    print(sys.path)
    raise


def dockerfile_here():
    '''
    Checks CWD for a Dockerfile
    :return: boolean
    '''
    cwd = os.path.abspath(os.path.curdir)
    contents = os.listdir(cwd)
    return ('Dockerfile' in contents)

def slurp_dockerfile():
    '''
    Only slurps from current working directory
    :return: Contents of Dockerfile in CWD
    '''
    with open('Dockerfile', 'r') as fh:
        contents = fh.read()

    return contents


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('version', help="Specify version to install",
                        default="latest", type=str)
    parser.add_argument('-t','--tag', help="Specify the tag to use instead of the default",
                        default='base')
    parser.add_argument('-m', help="Specify the master IP/hostname to use in \
        the image",
                        default='salt')
    parser.add_argument('-v', help="Print Python version and exit",
                        action='store_true', default=False)
    args = parser.parse_args()

    if args.v:
        print(sys.version)
        sys.exit(0)
    if not dockerfile_here():
        print("Must have a Dockerfile in the same directory")
        sys.exit(1)

    client = docker.APIClient(base_url='unix://var/run/docker.sock')

    try:
        pprint(client.version())
        print("Connected to Docker daemon")

        # Slurp in the contents of the Dockerfile and run the build
        # Mostly lifted from documentation at https://docker-py.readthedocs.io/en/stable/api.html#module-docker.api.build
        slurpy = slurp_dockerfile().encode('utf-8')
        f = BytesIO(slurpy)
        print("Building image with saltversion: {} and masterip: {}".format(args.version, args.m))
        ret = [line for line in
               client.build(path='./',
                            tag='{0}:{1}'.format(args.tag,args.version),
                            rm=True,
                            forcerm=True,
                            buildargs={'saltversion': args.version,
                                       'masterip': args.m})]

    except Exception as e:
        raise



    # pprint(ret)
    for row in ret:
        print(u'%s' % row)
