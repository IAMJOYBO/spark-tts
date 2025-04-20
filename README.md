# spark-tts
Docker镜像自动构建并上传到阿里云（最新Docker镜像前往 [GitHub Action](../../actions) 查看）
# 使用方法
```bash
git clone https://github.com/SparkAudio/Spark-TTS.git
cd Spark-TTS
huggingface-cli download SparkAudio/Spark-TTS-0.5B --local-dir ./SparkAudio/Spark-TTS-0.5B
modelscope download --model SparkAudio/Spark-TTS-0.5B --local_dir ./SparkAudio/Spark-TTS-0.5B # 可选，使用魔塔下载
```
将 Spark-TTS 映射至 Docker 中的 /app/spark-tts 即可，默认端口：7860
# 更多用法
[https://github.com/SparkAudio/Spark-TTS](https://github.com/SparkAudio/Spark-TTS)

# Star History

[![Star History Chart](https://api.star-history.com/svg?repos=IAMJOYBO/ktransformers&type=Date)](https://www.star-history.com/#IAMJOYBO/ktransformers&Date)
