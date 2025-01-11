# 苹方(PingFang)字体


## 说明

内容搬运自

1.PingFang <https://github.com/ACT-02/PingFang-for-Windows>

2.PingFang-Relaxed <https://github.com/ACT-02/PingFang-Relaxed>

3.PingFang-UI <https://bbs.pcbeta.com/viewthread-2012178-1-1.html>

同步请执行
```shell
chmod +x pull-fonts.sh

./pull-fonts.sh
```

## 安装

### 源码安装

```shell
git clone https://github.com/witt-bit/applePingFangFonts.git

# 安装苹方
cp -rf pingFang /usr/share/fonts/pingFang

# 安装开苹方
cp -rf pingFangRelaxed /usr/share/fonts/pingFangRelaxed

# 安装苹方UI
cp -rf pingFangUI /usr/share/fonts/pingFangUI
```

### ArchLinux/Manjaro安装

* 安装苹方

`yay -S otf-apple-pingfang`

* 安装开苹方

`yay -S otf-apple-pingfang-relaxed`

* 安装苹方UI

`yay -S otf-apple-pingfang-ui`