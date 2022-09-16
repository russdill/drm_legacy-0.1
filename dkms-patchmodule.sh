#!/bin/bash
kernelver="$1"
vers=(${kernelver//./ })    #split kernel version into individual elements
vers="${vers[0]}.${vers[1]}"    #recombine as needed
echo "Extracting ${kernelver} original source ${vers}"
tar -xf /usr/src/linux-source-$vers.tar.xz linux-source-$vers/$2 --xform=s,linux-source-$vers/$2,.,
for i in ${@:3}
do
  echo "Applying $i"
  patch -p1 < $i
done
