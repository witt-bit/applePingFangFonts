#!/usr/bin/env bash

rootPath=$(pwd);
tmp="${rootPath}/tmp"
mkdir -p "${tmp}";

pullPingFang() {
    pkgPath="${rootPath}/pingFang";
    src="PingFang-for-Windows";
    cd "${tmp}";
    if [ -d "${src}" ]; then
        cd "${src}";
        git fetch -p;
        git reset --hard FETCH_HEAD;
        git pull;
    else
        git clone https://github.com/ACT-02/PingFang-for-Windows.git;
        cd "${src}";
    fi

    # 遍历当前目录中的每个文件
    fonts=$(find . -type f \( -name "*.ttf" -o -name "*.otf" -o -name "*.woff" -o -name "*.woff2" \));
    for fontFile in $fonts; do
        dir_name=$(echo "$fontFile" | awk -F '-' '{ print $1 }' | sed 's/PingFang\([A-Z]\)/pingFang\1/g')
        buildPath="${pkgPath}/$dir_name";

        # 判断目录是否存在，不存在则创建目录
        if [ ! -d "$dir_name" ]; then
            mkdir -p "${buildPath}"
        fi

        echo "Copy Font ${fontFile} ---> ${buildPath}"

        cp "${fontFile}" "${buildPath}/"
    done

    echo "${src} finish ."
}

pullPingFangRelaxed() {
    pkgPath="${rootPath}/pingFangRelaxed";
    src="PingFang-Relaxed";
    cd "${tmp}";
    if [ -d "${src}" ]; then
        cd "${src}";
        git fetch -p;
        git reset --hard FETCH_HEAD;
        git pull;
    else
        git clone https://github.com/ACT-02/PingFang-Relaxed.git;
        cd "${src}";
    fi

    # 遍历当前目录中的每个文件
    fonts=$(find . -type f \( -name "*.ttf" -o -name "*.otf" -o -name "*.woff" -o -name "*.woff2" \));
    for fontFile in $fonts; do
        dir_name=$(echo "$fontFile" | awk -F '-' '{ print $1 }' | sed 's/PingFangRelaxed\([A-Z]\)/pingFangRelaxed\1/g')
        buildPath="${pkgPath}/$dir_name";

        # 判断目录是否存在，不存在则创建目录
        if [ ! -d "$dir_name" ]; then
            mkdir -p "${buildPath}"
        fi

        echo "Copy Font ${fontFile} ---> ${buildPath}"

        cp "${fontFile}" "${buildPath}"
    done

    echo "${src} finish ."
}

pullPingFang;
pullPingFangRelaxed;

echo "Done ."