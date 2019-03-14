#!/bin/bash

export LIBGL_ALWAYS_INDIRECT=1
export PATH=$PATH:/opt/plotter/bin
FN=$1
if test -z "$FN"; then
    echo "Usage: $0 <filename>"
    exit 1
fi

rm -f minmax

plotter2d -f ${FN} -v T -s "t0,0,0" -c "-1,-1,-1" -o T -min -3 -max 3 -zonal -imgsize 1024 1024 -colormap XGCLog

#plotter2d -f ${FN} -v dT -s "t0,0,0" -c "-1,-1,-1" -o dT -min 0 -max 1 -zonal -colormap XGCLog 

#plotter2d -f ${FN} -v dT -s "t0,0,0" -c "-1,-1,-1" -o dT -zonal -colormap XGCLog --minmaxfile minmax -p
#plotter2d -f ${FN} -v dT -s "t0,0,0" -c "-1,-1,-1" -o dT -zonal -colormap XGCLog --minmaxfile minmax --use-global-minmax
rm -f dT.[0-9][0-9][0-9][0-9].txt

