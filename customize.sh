#!/system/bin/sh
MODDIR=${0%/*}

minSdk=21
maxRam=2097152
devRam=0
cat /proc/meminfo | grep MemTotal | tr -cd "[0-9]" > $devRam

if [ "$BOOTMODE" != "true" ]
then
    ui_print "! Should install this module at Magisk manager."
fi

ui_print "- 检查兼容性.. "
if [ $API -ge $minSdk ] 
then
    if [ $maxRam -le $devRam ]
    then
        touch $MODPATH/disable
        ui_print "! 你的设备上的内存足够大，不适用此模块，已将其禁用。"
    fi
    ui_print "√ 配置完成！"
    ui_print "√ 由酷安@史蒂夫ZMT 开发"
else
    ui_print "! 需要安卓5.0以及更高版本。"
    abort "! 模块未安装。"
fi

#发现彩蛋！
#此模块是在单词笔上编辑并测试的！
