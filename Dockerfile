FROM baserow/baserow:latest
ENV BASEROW_PUBLIC_URL=https://neomkit-baserow.hf.space
ENV PORT=7860
ENV BASEROW_PORT=7860
EXPOSE 7860
COPY baserow-fix.sh /baserow-fix.sh
RUN chmod +x /baserow-fix.sh
ENTRYPOINT ["/baserow-fix.sh"]
