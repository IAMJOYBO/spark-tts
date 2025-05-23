FROM pytorch/pytorch:2.5.1-cuda12.4-cudnn9-runtime

WORKDIR /app/spark-tts
ENV TZ=Asia/Shanghai

RUN apt update && apt install -y wget net-tools tree curl ffmpeg gcc g++ cmake && wget https://github.com/SparkAudio/Spark-TTS/raw/refs/heads/main/requirements.txt && apt clean && rm -rf /var/lib/apt/lists/*
RUN  pip install -r requirements.txt && pip install -U gradio gradio_client && rm -rf ~/.cache/pip/*

RUN pip install -U triton --index-url https://aiinfra.pkgs.visualstudio.com/PublicPackages/_packaging/Triton-Nightly/pypi/simple/triton-nightly && rm -rf ~/.cache/pip/*

# 设置国内源
RUN mkdir -p /app/index-tts && rm -rf /etc/apt/sources.list && rm -rf /etc/apt/sources.list.d/*ubuntu*
COPY sources-22.04.list /etc/apt/sources.list
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
RUN pip config set install.trusted-host mirrors.aliyun.com

ENTRYPOINT ["python", "webui.py", "--server_name", "0.0.0.0", "--server_port", "7860", "--model_dir", "SparkAudio/Spark-TTS-0.5B"]
