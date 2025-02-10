#!/system/bin/sh
MODDIR=${0%/*}
# 脚本版本 v1.2.19


ui_print "- 通过修改build.prop来使系统启用低内存优化，同时启用了部分系统优化开关。"
ui_print "  适用于安卓5以上内存不满1GB的设备。由于会严重破坏体验，内存超过2GB的设备不要刷入。"
ui_print "  仍处于测试阶段，请确保你有救砖能力！ "
ui_print "- 已内置基本救砖组件，卡开机120秒后自动禁用，但需要手动重启。"
# 检查兼容性
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
    ui_print " "
    ui_print "√ 检查完成！"
    ui_print "√ 由酷安@史蒂夫ZMT 开发"
else
    ui_print "! 需要安卓5.0以及更高版本。"
    abort "! 模块未安装。"
fi

if [ -f "/data/local/tmp/enable" ];then
    ui_print " "
    ui_print " ==============================="
    ui_print "- 发现/data/local/tmp/enable文件"
    ui_print "- 正在应用激进的优化策略"
    ui_print "- 可有效节省缓存内存，但是可能导致一些问题"
    ui_print "  如屏幕死锁，后台进程消失，桌面进入卡顿等。"
    ui_print "  责  任  自  负"
    ui_print " ==============================="
    ui_print " "
    ui_print " "
    echo "debug.sf.latch_unsignaled=1" >> $MODPATH/system.prop
    echo "debug.sf.nobootanimation=1"  >> $MODPATH/system.prop
    echo "persist.sys.ui.hw=1" >> $MODPATH/system.prop
    echo "ro.kernel.checkjni=0" >> $MODPATH/system.prop
    echo "ro.kernel.android.checkjni=0" >> $MODPATH/system.prop
    echo "persist.sys.use_dithering=0" >> $MODPATH/system.prop
#    echo "persist.sys.purgeable_assets=1" >> $MODPATH/system.prop
    echo "dalvik.vm.execution-mode=int:jit" >> $MODPATH/system.prop
    rm /data/local/tmp/enable
  else
  ui_print " "
  ui_print " ==============================="
  ui_print "- 本模块有更激进的优化方案可用，可有效节省缓存内存，但是可能导致一些问题"
  ui_print "  如屏幕死锁，后台进程消失，桌面进入卡顿等。"
  ui_print "- 若要启用，请在/data/local/tmp/目录下新建enable文件"
  ui_print "  ，然后重新使用Magisk Manager安装此模块。 "
  ui_print " "
  ui_print " ==============================="
  ui_print " "
  ui_print " "
  sleep 3
fi

#发现彩蛋！
#此模块是在单词笔上编辑并测试的！
