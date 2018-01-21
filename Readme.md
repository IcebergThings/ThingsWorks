# ThingsWorks

这是一个由[Love2D](love2d.org)及一系列实用库构成的2D游戏~~引擎~~lib集合。

它**本意不是**给小白设计的，但是在此欢迎所有人来尝试。毕竟谁不是在试验和试错的路上长大的呢？

---

## 1. 名称

对，这个引擎就叫**ThingsWorks**，是由Iceberg**Things**团队开发的一个极其简约轻量化的GameWorks，所以就叫ThingsWorks了~

“诶诶诶，那中文名呢？”

“虽说ThingsWorks的最直白翻译就是好使，但是我也不确定呀”

## 2. 架构

引擎使用Love2D，同时尽量保证各个平台的兼容性与最小化特性，引擎各组件本体皆使用LuaJIT编程。（可能会引入Platform Specific的FFI库，例如Steamworks支持等）其语法可能会因为Lua版本更新或Love2d版本更新而变动。

:warning: **警告：该lib集还在极其早期的开发阶段，API十分不稳定**

lib合集本体包含：
1. main.lua
    - 将其他组件连接在一起的核心部分
    - 其实你若不使用本库的SceneManager，你可以随意地更改main
    - 如果使用SceneManager，那对于用户来说真正的入口在MainScene.lua
2. scene.lua
    - 非常核心的一个组件，~~虽然在有些时候你完全没有必要去使用它~~
    - 管理场景，场景切换，以及场景实例创建
3. particles.lua
    - 一个可以放在任何love2d游戏中standlone使用的轻量级粒子引擎
    - 和自带的粒子引擎思想有不少不同，请按需选择
4. button.lua
    - 一个按钮库

用户可以~~随便乱搞~~完成他们代码的文件包括
1. MainScene.lua
2. XXXScene.lua
    - 各个场景的文件
3. XXX.lua
    - 其他杂七杂八的文件
    - 之所以叫ThingsWorks，是因为它不是严格意义的engine，只是方便各式开发的库集合罢了XD
