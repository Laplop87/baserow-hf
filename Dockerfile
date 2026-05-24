FROM baserow/baserow:latest
ENV BASEROW_PUBLIC_URL=https://neomkit-baserow.hf.space
ENV PORT=7860
ENV BASEROW_PORT=7860
EXPOSE 7860

# Fix Supervisor logging (Hugging Face doesn’t allow seek on stdout)
RUN sed -i 's/logfile=.*/logfile=\/dev\/stdout/' /etc/supervisor/supervisord.conf \
    && sed -i 's/logfile_maxbytes=.*/logfile_maxbytes=0/' /etc/supervisor/supervisord.conf \
    && sed -i 's/logfile_backups=.*/logfile_backups=0/' /etc/supervisor/supervisord.conf

# Use the original entrypoint
ENTRYPOINT ["/baserow.sh"]
