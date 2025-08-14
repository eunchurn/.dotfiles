#!/bin/bash

ACR_NAME=imqav3
ACR_SERVER="${ACR_NAME}.azurecr.io"
USERNAME="00000000-0000-0000-0000-000000000000"

echo "Logging in to Azure Container Registry: $ACR_SERVER"

# Method 1: nerdctl을 사용한 직접 로그인 (권장)
echo "Attempting nerdctl login..."
REFRESH_TOKEN=$(az acr login -n $ACR_NAME --expose-token --query accessToken -o tsv)
if [ $? -eq 0 ] && [ ! -z "$REFRESH_TOKEN" ]; then
    echo $REFRESH_TOKEN | nerdctl login $ACR_SERVER -u $USERNAME --password-stdin
    if [ $? -eq 0 ]; then
        echo "✅ Successfully logged in to $ACR_SERVER with nerdctl"
        exit 0
    fi
fi

# Method 2: Docker config 파일 직접 생성 (fallback)
echo "Attempting to create Docker config manually..."
if [ ! -z "$REFRESH_TOKEN" ]; then
    # base64 인코딩된 auth 생성
    AUTH=$(echo -n "${USERNAME}:${REFRESH_TOKEN}" | base64)
    
    # config.json 쓰기
    mkdir -p ~/.docker
    cat <<EOF > ~/.docker/config.json
{
  "auths": {
    "${ACR_SERVER}": {
      "auth": "${AUTH}"
    }
  }
}
EOF
    echo "✅ Docker config created manually for $ACR_SERVER"
    exit 0
fi

echo "❌ Failed to login to $ACR_SERVER"
exit 1