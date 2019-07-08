#!/bin/sh
basepath=$(cd `dirname $0`; pwd)
echo $basepath
tar czvf www/myhead2.tar www/myhead2.obj
