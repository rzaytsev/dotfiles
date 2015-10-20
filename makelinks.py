#!/usr/bin/env python

import os

if __name__ == '__main__':
    home = os.environ['HOME']
    with open('{}/dotfiles/links'.format(home), 'r') as config:
        links = config.readlines()

    for link in links:
        dst, src = link.replace('\n','').split('=')
        try:
            os.symlink("{}/dotfiles/{}".format(home, src),
                       "{}/{}".format(home, dst))
        except OSError, e:
            if e.errno == 17:
		pass
            else:
                raise e

