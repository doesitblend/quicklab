import salt
import salt.config
#from bs4 import BeautifulSoup
import requests
from lxml import html

__virtualname__ = 'checkit'


def __virtual__():
    '''
    Return the name of the module for the loader.
    '''
    return 'checkit'


def busy(url):
    '''
    Run a test query against some site
    '''
    response = requests.get(url)
    return {'html': response.content}


#def soup(url):
#    response = requests.get(url)
#    soup = BeautifulSoup(response.content, 'html.parser')
#    return {'data': soup}


def alt(url):
    try:
        response = requests.get(url)
        tree = html.fromstring(response.content)
        return {'data': tree.__repr__()}
    except Exception as e:
        return {'data': False, 'error': e.message}

