## 开发
#  因为 node.js V17版本中最近发布的OpenSSL3.0, 而OpenSSL3.0对允许算法和密钥大小增加了严格的限制
#解决方案:
# 方案1：打开IDEA 终端，直接输入
# Linux & Mac OS：
# export NODE_OPTIONS=--openssl-legacy-provider
# Windows：
# set NODE_OPTIONS=--openssl-legacy-provider

# 方案2：打开IDEA 终端，直接输入（问题解决）
# $env:NODE_OPTIONS="--openssl-legacy-provider"

# 方案3：卸载Node.js17+版本，安装Node.js17-版本（一劳永逸，本人太懒就没尝试）

```bash
# 克隆项目
git clone https://gitee.com/y_project/RuoYi-Vue

# 进入项目目录
cd ruoyi-ui

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npm.taobao.org

# 启动服务
npm run dev
```

浏览器访问 http://localhost:80

## 发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```