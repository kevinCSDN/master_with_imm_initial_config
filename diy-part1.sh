#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
#问题：git clone -b master https://github.com/sirpdboy/luci-theme-kucat.git和
#      git clone --depth=1 -b master https://github.com/sirpdboy/luci-theme-kucat  的效果一样吗？
#回答：两个命令都是用于克隆Git仓库的，有一些细微的差别：
#git clone -b master https://github.com/sirpdboy/luci-theme-kucat.git：这个命令克隆整个仓库（luci-theme-kucat.git）并检出master分支。
#git clone --depth=1 -b master https://github.com/sirpdboy/luci-theme-kucat：这个命令同样克隆仓库并检出master分支，但使用了--depth=1选项。这个选项创建一个浅克隆，只包含最新的提交，没有超过指定深度的提交历史。
#这两个命令的实际效果是，第二个命令（--depth=1）创建了一个更小的克隆，只包含最新的提交，而没有完整的提交历史。这对于只关注仓库的最新状态并且想要节省带宽和磁盘空间的情况可能会很有用。
#总的来说，就代码而言，这两个命令的结果可能是一样的，但第二个命令（--depth=1）创建了一个更小的克隆，没有完整的历史记录。
      

# Uncomment a feed source
# 将原luci注释掉
#sed -i '/luci/s/^/#/' feeds.conf.default
#sed -i '/routing/s/^/#/' feeds.conf.default
#sed -i '/packages/s/^/#/' feeds.conf.default

#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git lede_luci https://github.com/coolsnowwolf/luci' feeds.conf.default
#sed -i '$a src-git packages https://github.com/coolsnowwolf/packages' feeds.conf.default
#sed -i '$a src-git luci https://github.com/coolsnowwolf/luci' feeds.conf.default
#sed -i '$a src-git routing https://github.com/coolsnowwolf/routing' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kiddin9/openwrt-packages' feeds.conf.default
#git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge

#拉取文件包里一个插件的方法
#拉取整个包
#git clone https://github.com/haiibo/openwrt-packages 
#赋予删除的权限         
#shopt -s extglob
#删除除了luci-app-bypass之外的所有插件，如果保留smartdns可以这样写rm -rf openwrt-packages/!(luci-app-bypass|luci-app-smartdns|helloworld)
#rm -rf openwrt-packages/!(luci-app-vssr|lua-maxminddb|helloworld)
#拷贝到插件库package
#cp -r openwrt-packages/luci-app-vssr package/
#cp -r openwrt-packages/lua-maxminddb package/
#cp -r openwrt-packages/helloworld package/
#rm -rf openwrt-packages

#精简代码
#rm -rf openwrt-packages/!(luci-app-vssr|lua-maxminddb|helloworld)
#cp -r openwrt-packages/{luci-app-vssr,lua-maxminddb,helloworld} package/
#rm -rf openwrt-packages



git clone https://github.com/kiddin9/openwrt-packages
shopt -s extglob
rm -rf openwrt-packages/!(luci-app-netdata|luci-app-smartdns|luci-app-upnp)
cp -r openwrt-packages/{luci-app-netdata,luci-app-smartdns,luci-app-upnp} package/
rm -rf openwrt-packages

#git clone https://github.com/coolsnowwolf/luci luci1
#shopt -s extglob
#rm -rf luci1/applications/!(luci-app-autoreboot)
#cp -r luci1/applications/luci-app-autoreboot package/
#rm -rf luci1


#删除feeds自带mosdns、v2ray-geodata
rm -rf ./feeds/packages/net/mosdns
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-Bootstrap
rm -rf feeds/luci/themes/luci-theme-BootstrapDark
rm -rf feeds/luci/themes/luci-theme-BootstrapLight

cd package
git clone https://github.com/f8q8/luci-app-autoreboot.git
git clone -b js https://github.com/sirpdboy/luci-theme-kucat.git
#git clone -b main https://github.com/sirpdboy/luci-app-advancedplus.git
cd ..

git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config




#克隆passwall环境插件
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/pwpage

#克隆的源码放在small文件夹,预先建立small文件夹
mkdir package/small
pushd package/small

#克隆源码

#passwall2
git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git
git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall.git
#mosdns
# git clone -b v5 --depth 1 https://github.com/sbwml/luci-app-mosdns.git
#git clone --depth=1 https://github.com/fw876/helloworld.git
#git clone https://github.com/kevinCSDN/lua-maxminddb.git  #git lua-maxminddb 依赖
#git clone https://github.com/qqhpc/jerrykuku-luci-app-vssr.git
#git clone --depth=1 https://github.com/cfxy2010/luci-app-turboacc.git

# git clone https://github.com/kevinCSDN/luci-app-vssr-plus.git  

popd
