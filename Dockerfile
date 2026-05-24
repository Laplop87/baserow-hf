FROM baserow/baserow:latest
ENV BASEROW_PUBLIC_URL=https://neomkit-baserow.hf.space
ENV PORT=7860
ENV BASEROW_PORT=7860
EXPOSE 7860

# Save the original entrypoint and use our custom one
RUN cp /entrypoint.sh /original-entrypoint.sh
COPY custom-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
