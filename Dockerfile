# 使用官方的 Node.js 作为基础镜像
FROM node:18

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 文件到工作目录
COPY package*.json ./

# 安装依赖项
RUN npm install

# 复制应用程序代码到容器内
COPY . .

# 暴露新的端口（改为 3005）
EXPOSE 3005

# 设置环境变量（Coolify 会自动注入）
ENV TOGETHER_API_KEY=${TOGETHER_API_KEY}

# 启动应用程序，并指定监听 3005 端口
CMD ["npm", "run", "dev", "--", "--port", "3005"]
