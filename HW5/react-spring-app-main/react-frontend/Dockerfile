# Dockerfile (без multi-stage, т.е. builder и runtime в одном)
FROM node:24-alpine

WORKDIR /app


RUN addgroup -S appgroup && \
    adduser -S -G appgroup -u 1001 appuser && \
    chown -R appuser:appgroup /app

COPY --chown=appuser:appgroup package*.json ./



RUN npm ci --omit=dev && npm cache clean --force

COPY --chown=appuser:appgroup . .

USER appuser

RUN mkdir -p /app/build


CMD ["npm", "run", "build"]
