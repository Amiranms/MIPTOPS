FROM builder AS runner 

COPY . / 

RUN adduser -D devops2024user

RUN chown devops2024user:devops2024user /bin/C /bin/print_hello /app.py

EXPOSE 8898 

USER devops2024user

CMD ["/venv/bin/python", "/app.py", "--host=0.0.0.0", "--port=8898"]