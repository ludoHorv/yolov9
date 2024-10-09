FROM dataloopai/dtlpy-agent:gpu.cuda.11.8.py3.8.pytorch2

RUN pip install --user \
    ultralytics==8.2.22 \
    pyyaml

USER 1000

RUN pip install --user https://storage.googleapis.com/dtlpy/dev/dtlpy-1.96.6-py3-none-any.whl

RUN pip install --user https://storage.googleapis.com/dtlpy/agent/dtlpy_agent-1.96.6.1-py3-none-any.whl

COPY --chown=1000:1000 yolov9 /tmp/app

WORKDIR /tmp/app

ENV DATALOOP_PATH=/tmp/app
# docker build --no-cache -t gcr.io/viewo-g/piper/agent/runner/apps/offline-yolov9:0.1.23 -f Dockerfile .
