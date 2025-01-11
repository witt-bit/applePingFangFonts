#!/usr/bin/env bash

fontName=$1

case ${fontName} in
  "pingFang" | "PingFang" | "pingfang" | "Ping Fang")
    fontPath="pingFang/pingFangSC/PingFangSC-Regular.otf";
    ;;
  "PingFangRelaxed" | "pingFangRelaxed" | "PingFang-Relaxed" | "pingFang-Relaxed")
    fontPath="pingFangRelaxed/pingFangRelaxedSC/PingFangRelaxedSC-Regular.otf";
    ;;
  "PingFangUI" | "pingFangUI" | "PingFang-UI")
    fontPath="pingFangUI/pingFangUISC/PingFangUISC-Black.ttf";
    ;;
  *)
    echo "Support 'PingFang' , 'PingFangRelaxed' , 'PingFangUI' ."
    exit 1;
    ;;
esac

otfinfo -i "${fontPath}" | awk '/Version:.*/ { print $2 }'

