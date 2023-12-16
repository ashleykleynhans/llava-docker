#!/usr/bin/env bash
source /workspace/venv/bin/activate
cd /workspace/LLaVA
if [[ $OPENAI_API_KEYS ]]; then
  nohup python3 -m llava.serve.openai_api_server \
   --host ${LLAVA_HOST} \
   --port ${OPENAI_API_PORT} \
   --controller-address http://localhost:${LLAVA_CONTROLLER_PORT} \
   --api-keys ${OPENAI_API_KEYS} > /workspace/logs/openai-api.log 2>&1 &
else
  nohup python3 -m llava.serve.openai_api_server \
   --host ${LLAVA_HOST} \
   --port ${OPENAI_API_PORT} \
   --controller-address http://localhost:${LLAVA_CONTROLLER_PORT} > /workspace/logs/openai-api.log 2>&1 &
fi
deactivate
