# Python 3.11 베이스 이미지 사용
FROM python:3.11-slim

# 작업 디렉토리 설정
WORKDIR /app

# 시스템 패키지 업데이트 및 필요한 도구 설치
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    curl \
    && rm -rf /var/lib/apt/lists/*

# requirements.txt 복사 및 의존성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 소스 코드 복사 (docker-compose에서 볼륨 마운트하므로 선택사항)
# COPY src/ /app/src/

# 기본 명령어 설정
# 컨테이너가 계속 실행되도록 설정 (수동으로 명령 실행 가능)
CMD ["tail", "-f", "/dev/null"]
