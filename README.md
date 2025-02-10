# magisk-low_ram
Enable Android Go on your low ram device by installing this module.

## 安装前准备

- 确保您的设备已经Root并且已经安装了最新版的Magisk。
- 请在安装本模块前备份您的系统。在发生不可预料的问题时，备份能帮助您恢复设备至正常状态。

## 安装说明

### 通过Magisk Manager（推荐）

1. 打开`Magisk Manager`应用。
2. 点击侧滑菜单中的`模块`。
3. 点击底部的`从存储设备安装`。
4. 选择您下载的模块ZIP文件。
5. 安装完成后，重启设备以激活模块。

### 通过Recovery模式

模块不支持Recovery方式安装。

## 使用方法

安装后模块会移动配置。

### 进阶配置

模块默认**不启用**以下配置：

- `debug.sf.latch_unsignaled`
根据[android 文档](https://source.android.com/docs/core/graphics/unsignaled-buffer-latch?hl=zh-cn),`debug.sf.latch_unsignaled` 标志允许 SurfaceFlinger 锁存所有无信号的缓冲区,这在一些情况下会减少内存使用。但是根据官方文档声明，启用此配置会出现一些非预期的附带效应，例如在等待未完成的缓冲区期间破坏同步事务和冻结整个显示屏（虽然这从未发生在开发人员的设备上）。

 - `debug.sf.nobootanimation`
停用开机动画以省略开机动画载入和渲染流程，可能在部分设备上不生效。

 - `persist.sys.ui.hw`
 - `persist.sys.force_sw_gles`
硬件加速的用户界面渲染。硬件加速可以提高图形性能和响应速度。

禁用 JNI（Java Native Interface）检查。禁用这些检查可以提高性能，但可能会忽略一些潜在的 JNI 错误。

禁用抖动效果。抖动是一种图像处理技术，用于减少颜色带状效应。禁用抖动可以提高性能，但可能会影响图像质量。

清除资源的功能。启用这个功能可以帮助系统更有效地管理内存，特别是在资源有限的设备上。

若要启用，请在/data/local/tmp/目录下新建enable文件，然后安装模块。

## 卸载说明

1. 打开`Magisk Manager`应用。
2. 前往`模块`部分。
3. 找到您要卸载的模块，点击删除图标。
4. 重启设备以完成卸载。

## 许可证

本模块遵循GPLv3许可证。您可以在LICENSE文件中查阅完整的许可证文本。


