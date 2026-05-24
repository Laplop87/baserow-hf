FROM baserow/baserow:latest
ENV BASEROW_PUBLIC_URL=https://neomkit-baserow.hf.space
ENV BASEROW_PORT=7860
ENV PORT=7860
ENV DISABLE_VOLUME_CHECK=yes

# Admin account – set real values via Hugging Face Space Secrets (see below)
ENV BASEROW_ADMIN_USERNAME=admin
ENV BASEROW_ADMIN_PASSWORD=
ENV BASEROW_ADMIN_EMAIL=

EXPOSE 7860

# Fix Supervisor logging and Caddy port
RUN sed -i 's/logfile=.*/logfile=\/dev\/stdout/' /etc/supervisor/supervisord.conf \
    && sed -i 's/logfile_maxbytes=.*/logfile_maxbytes=0/' /etc/supervisor/supervisord.conf \
    && sed -i 's/logfile_backups=.*/logfile_backups=0/' /etc/supervisor/supervisord.conf \
    && sed -i 's/:80/:7860/' /baserow/caddy/Caddyfile

CMD ["start"]
