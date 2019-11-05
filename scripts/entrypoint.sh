#!/bin/bash

#activate virtual env
. /appenv/bin/activate

#pass command line arguments to execute in same shell process
exec $@