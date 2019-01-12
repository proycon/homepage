#!/bin/bash
hugo && rsync -avz --delete public/ anaproy.nl:~/projects/homepage19
exit $?
