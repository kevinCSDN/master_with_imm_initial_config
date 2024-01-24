#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)



# 拉取 immortalwrt master 源码
git clone -b master https://github.com/immortalwrt/immortalwrt.git iwrt
# 提取 fullconenat-nft 源码
cp -rf iwrt/package/network/utils/fullconenat-nft package/network/utils/fullconenat-nft
# 提取 fullconenat 源码
cp -rf iwrt/package/network/utils/fullconenat package/network/utils/fullconenat
# 提取 default-settings 源码
cp -rf iwrt//package/emortal/default-settings package/default-settings
# 删除 immortalwrt master 源码
