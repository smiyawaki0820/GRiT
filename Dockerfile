# https://github.com/JialianW/GRiT/blob/master/docs/INSTALL.md

ARG BASE_IMAGE="grit:latest"
FROM ${BASE_IMAGE}

COPY . /app
WORKDIR /app

RUN echo "|--> Install Pytorch packages" && \
    pip install torch==1.10.0+cu111 torchvision==0.11.0+cu111 torchaudio==0.10.0 -f https://download.pytorch.org/whl/torch_stable.html && \
    python -m pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu113/torch1.10/index.html && \
    pip install -r /app/requirements.txt --no-cache-dir && \
    rm -rf /app/.cache/pip
