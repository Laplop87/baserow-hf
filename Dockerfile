FROM baserow/baserow:latest
ENV BASEROW_PUBLIC_URL=https://neomkit-baserow.hf.space
ENV BASEROW_PORT=7860
ENV PORT=7860
ENV DISABLE_VOLUME_CHECK=yes
EXPOSE 7860

RUN sed -i 's/logfile=.*/logfile=\/dev\/stdout/' /etc/supervisor/supervisord.conf \
    && sed -i 's/logfile_maxbytes=.*/logfile_maxbytes=0/' /etc/supervisor/supervisord.conf \
    && sed -i 's/logfile_backups=.*/logfile_backups=0/' /etc/supervisor/supervisord.conf

CMD ["start"]
