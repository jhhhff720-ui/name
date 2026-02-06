# 使用官方 Python 基础镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装依赖
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 复制代码
COPY app.py .

# 暴露端口
EXPOSE 5000

# 启动服务
CMD ["python", "app.py"]

# 额外优化：确保依赖安装稳定
RUN pip install --upgrade pip     && pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 额外优化：让服务监听所有接口
CMD ["python", "-c", "from app import app; app.run(host='0.0.0.0', port=5000)"]
