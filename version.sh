#!/usr/bin/env bash

fontName=$1

case ${fontName} in
  "pingFang" | "PingFang" | "pingfang" | "Ping Fang")
    fontPath="pingFang/pingFang-SC/PingFangSC-Regular.otf";
    ;;
  "PingFangRelaxed" | "pingFangRelaxed" | "PingFang-Relaxed" | "pingFang-Relaxed")
    fontPath="pingFangRelaxed/pingFangRelaxed-SC/PingFangRelaxedSC-Regular.otf";
    ;;
  *)
    echo "Support 'PingFang' , 'PingFangRelaxed' ."
    exit 1;
    ;;
esac

otfinfo -i "${fontPath}" | awk '/Version:.*/ { print $2 }'

